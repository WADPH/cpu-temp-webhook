#!/bin/bash

TOKEN="<YOUR_TOKEN>"
CHAT_ID="<YOUR_CHAT_ID>"
THRESHOLD=75 #You can change this

sensors | grep "Package id" | while read -r line; do
    NAME=$(echo "$line" | awk '{print $1" "$2" "$3}')   # Package id 0 or Package id 1 #If you have several packages
    TEMP=$(echo "$line" | awk '{print $4}' | tr -d '+°C') 
    TEMP_INT=${TEMP%.*}

    if (( TEMP_INT > THRESHOLD )); then
        MSG="Remote ProxmoxVE Warning: CPU ($NAME) = ${TEMP}°C (max: ${THRESHOLD}°C)"
        curl -s -X POST https://api.telegram.org/bot$TOKEN/sendMessage \
             -d chat_id=$CHAT_ID \
             -d text="$MSG"
    fi
done
