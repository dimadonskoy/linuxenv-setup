#!/usr/bin/env bash
#######################################################################
#Developed by : Dmitri Donskoy
#Purpose : Create user 
#Date : 15.02.2025
#Version : 0.0.1
# set -x
set -o errexit
set -o nounset
set -o pipefail
#######################################################################

# Check if user is root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

# Create LOGS directory if  not exist
if [ ! -d "$PWD/LOGS" ]; then
    echo "LOGS directory does not exist. Creating LOGS directory..."
    mkdir -p $PWD/LOGS
fi

LOGFILE=$PWD/LOGS/user_create.log

#create user in ubuntu
function create_user() {
    read -p "Enter a username: " USERNAME
    read -s -p "Enter a password: " PASSWORD
    echo "$PASSWORD" | base64 > .secret
    echo "Creating user..." 2>&1 | tee -a "$LOGFILE"

    # Check if user exists
    if id "$USERNAME" ; then
        echo "User already exists." 2>&1 | tee -a "$LOGFILE"
    else
        echo "User does not exist. Creating user..." 2>&1 | tee -a "$LOGFILE"
        # Create user
        useradd -m -s /bin/bash $USERNAME
        echo "$USERNAME:$(cat .secret | base64 --decode)" | chpasswd
        usermod -aG sudo $USERNAME
        echo "User creation completed." 2>&1 | tee -a "$LOGFILE"
        echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers > /dev/null
        sudo -v
    fi

    # delete secret file
    rm -rf .secret
}

create_user
