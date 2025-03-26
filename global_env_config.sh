#!/usr/bin/env bash
#######################################################################
#Developed by : Dmitri Donskoy
#Purpose : Install my environment GLOBAL CONFIGURATION
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

LOGFILE=$PWD/LOGS/global_env_config.log

#Update ubuntu
function update_ubuntu(){
    {
        echo "Updating Ubuntu..."
        apt-get update && apt-get upgrade -y
        apt-get autoremove -y && apt-get autoclean -y
        echo "Ubuntu update completed."
    } 2>&1 | tee -a "$LOGFILE"
}

#Docker installation
function install_docker(){
    {
        echo "Uninstall all conflicting packages..."
        for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
        echo "Installing Docker..."
        apt-get install -y ca-certificates curl gnupg
        apt-get install ca-certificates curl
        install -m 0755 -d /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        chmod a+r /etc/apt/keyrings/docker.asc

        # Add the repository to Apt sources:
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null
        apt-get update
        apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
        echo "Docker installation completed."
    } 2>&1 | tee -a "$LOGFILE" 
}


#Install needed software
function install_software(){
    {
        echo "Installing software..."
        install_docker ## call function
        apt-get install git nginx vim python3 python3-pip  -y
        echo "Software installation completed."
    } 2>&1 | tee -a "$LOGFILE"
}

#Install python libraries

python_libs=("python3-flask" "python3-flask-mail" "python3-requests" "python3-netifaces" "python3-paramiko")

function install_python_libs(){
    {
        echo "Installing Python libraries..."
        for lib in "${python_libs[@]}"; do
            apt-get install $lib -y
        done
        echo "Python libraries installation completed."
    } 2>&1 | tee -a "$LOGFILE"
}

update_ubuntu
install_software
install_python_libs

