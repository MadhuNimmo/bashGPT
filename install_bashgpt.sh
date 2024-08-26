#!/bin/bash

# Name of the script
SCRIPT_NAME="bashgpt"

# Directory where the script should be installed
INSTALL_DIR="/usr/local/bin"

# Check if the script is being run with sudo or root privileges
if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root or with sudo to install globally."
  exit 1
fi

# Copy the script to the install directory
echo "Installing $SCRIPT_NAME to $INSTALL_DIR..."
cp "$SCRIPT_NAME" "$INSTALL_DIR/"

# Make the script executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Check if the script was installed successfully
if [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
  echo "$SCRIPT_NAME has been installed successfully and is now globally accessible."
else
  echo "Failed to install $SCRIPT_NAME. Please check for errors."
  exit 1
fi
