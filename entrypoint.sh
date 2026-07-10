#!/bin/bash

# Automatically fix permissions for Docker-initialized named volumes
# (The '|| true' prevents the script from crashing if the folders don't exist yet)
sudo chown -R developer:developer /home/developer /app/.dart_tool /app/build 2>/dev/null || true

# Automatically restart the ADB server as root to grab the USB connection
sudo /opt/android-sdk/platform-tools/adb kill-server
sudo /opt/android-sdk/platform-tools/adb start-server

# Hand control back over to whatever command Docker was asked to run (e.g., 'bash' or 'flutter run')
exec "$@"
