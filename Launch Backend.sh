#!/bin/bash

# Install Komodo peripherals
echo "Installing Komodo peripherals..."
sudo curl -sSL https://raw.githubusercontent.com/mbecker20/komodo/main/scripts/setup-periphery.py | sudo python3 || {
  echo "Failed to install Komodo peripherals"
  exit 1
}

# Check if Twingate service is running
if ! systemctl is-active --quiet twingate.service; then
  echo "Starting Twingate service..."
  sudo twingate start
else
  echo "Twingate service is already running"
fi

# Verify the service started successfully
if systemctl is-active --quiet twingate.service; then
  echo "Twingate service is running"
else
  echo "Failed to start Twingate service"
  exit 1
fi
