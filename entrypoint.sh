#!/bin/bash

# Automatically fix permissions for Docker-initialized named volumes
# (The '|| true' prevents the script from crashing if the folders don't exist yet)
sudo chown -R developer:developer /home/developer /app/.dart_tool /app/build 2>/dev/null || true

# Use the host's ADB server (already authorized with the phone's RSA key).
# The container shares the host network, so adb connects through it.
# Wait for device and set up reverse port forwarding to backend
sudo /opt/android-sdk/platform-tools/adb wait-for-device
sudo /opt/android-sdk/platform-tools/adb reverse tcp:8080 tcp:8080

# Hand control back over to whatever command Docker was asked to run (e.g., 'bash' or 'flutter run')
exec "$@"
