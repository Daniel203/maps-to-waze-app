FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites
RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils zip libglu1-mesa \
    openjdk-17-jdk wget \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV ANDROID_HOME=/opt/android-sdk
ENV FLUTTER_HOME=/opt/flutter
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${FLUTTER_HOME}/bin

# Prevent tar from trying to restore original ownership during extractions
ENV TAR_OPTIONS="--no-same-owner"

# Download and install Android SDK Command-line Tools
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    cd ${ANDROID_HOME}/cmdline-tools && \
    wget -q https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O tools.zip && \
    unzip -q tools.zip && rm tools.zip && mv cmdline-tools latest

# Accept licenses and install required SDK components
RUN yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b stable ${FLUTTER_HOME} && \
    flutter precache

# Accept Android licenses for Flutter
RUN yes | flutter doctor --android-licenses

# Host UID and GID (default to 1000, standard for Arch)
ARG UID=1000
ARG GID=1000

# Install sudo (needed for the USB workaround)
RUN apt-get update && apt-get install -y sudo && rm -rf /var/lib/apt/lists/*

# Create the 'developer' user 
RUN groupadd -g ${GID} developer && \
    useradd -u ${UID} -g developer -m -s /bin/bash developer

# Allow the developer user to execute sudo without a password
RUN echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Give the developer ownership of the SDKs so Flutter can write cache files
RUN chown -R developer:developer /opt/android-sdk /opt/flutter

# Copy the entrypoint script into the container and make sure it's executable
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Switch to the new non-root user
USER developer
WORKDIR /app

# Tell Docker to run this script every time the container starts
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# The default command passed to the entrypoint
CMD ["bash"]
