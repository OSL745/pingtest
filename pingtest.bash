#!/bin/bash
# Modified by: Jason Carman; jason.carman@senecapolytechnic.ca
# Updated: January 16, 2025
# Purpose: This script will read the /etc/hosts file and check the status of all hosts
# Usage: ./pingtest.bash
#

# Print a header
printf "\033[35m%-8s\t%-8s\n" "host" "status"

# Read the /etc/hosts file and check the status of all hosts
while read line; do

        # Check if the line starts with 192.168.100
        if echo $line | grep "^192.168.100" >> /dev/null; then

                # Extract the IP address and store it in the addr variable
                addr=$(echo $line | cut -d' ' -f1)

                # Extract the hostname and store it in the host variable
                host=$(echo $line | cut -d' ' -f2)

                # Ping each host for 1 second and check the status. If it is successful, the host is online.
                if ping -c1 $addr > /dev/null; then
                        printf "\033[0m%-8s\t\033[32m%-8s\n" "$host" "online"
                # Ping failed, so the host is offline.
                else
                        printf "\033[0m%-8s\t\033[31m%-8s\n" "$host" "offline"
                fi

        fi

# Read the /etc/hosts file
done < /etc/hosts