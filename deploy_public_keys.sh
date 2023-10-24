#!/usr/bin/env bash

# Ensure there are no commas between the file names, as bash arrays are space separated
FILES=("martin-desktop-ed25519.pub" "connor_lock_rsa.pub" "matt-desktop-20211004.pub" "ben_id_rsa.pub" "chris_moss_rsa.pub" "connor_voisey_id_rsa.pub")

AUTH_FILE="/root/.ssh/authorized_keys"

# Empty authorized_keys file
if [[ -f "${AUTH_FILE}" ]]; then
    echo "Emptying ${AUTH_FILE}"
    truncate -s 0 "${AUTH_FILE}"
fi

# Loop through each file
for FILE in "${FILES[@]}"; do
    # Download file content from GitHub and append to authorized_keys
    echo "Downloading ${FILE} from GitHub and appending to $AUTH_FILE"
    PUBKEY=$(curl -s "https://raw.githubusercontent.com/Exe-Squared/public-keys/main/$FILE")
    echo "${PUBKEY}" | tee -a "${AUTH_FILE}"
done
