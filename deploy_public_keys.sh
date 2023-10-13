#!/bin/bash

FILES=("martin_desktop_ed25519.pub", "connor_lock_rsa.pub" )

# Initialize an empty string to store all content
ALL_CONTENT=""

# Loop through each file and download its content
for FILE in $FILES; do
    # Download file content from GitHub and concatenate
    FILE_CONTENT=$(curl -s "https://raw.githubusercontent.com/Exe-Squared/public-keys/main/$FILE")
    ALL_CONTENT+="$FILE_CONTENT\n"
done

# Print all content
echo -e $ALL_CONTENT > /root/.ssh/authorized_keys
