#!/usr/bin/env bash
#######################################################################
#Developed by : Dmitri Donskoy
#Purpose : Install my environment USER CONFIGURATION
#Date : 15.02.2025
#Version : 0.0.1
# set -x
set -o errexit
set -o nounset
set -o pipefail
#######################################################################

# Get the home directory of the current user who run sudo .
USER_HOME=$(eval echo ~$SUDO_USER)  

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

LOGFILE=$PWD/LOGS/user_env_config.log

### configure vim ###
function configure_vim(){
    {
        echo "Configuring Vim..."
        
        ## Check if .vimrc exists, create if not
       if [ ! -f "$PWD/.vimrc" ]; then
           touch "$PWD/.vimrc"
       fi

        ### Add settings
        echo "set number" >> "$PWD/.vimrc"
        echo "syntax enable" >> "$PWD/.vimrc"
        echo "set ts=4" >> "$PWD/.vimrc"
        echo "set autoindent" >> "$PWD/.vimrc"
        echo "set expandtab" >> "$PWD/.vimrc"
        echo "set shiftwidth=4" >> "$PWD/.vimrc"
        echo "set cursorline" >> "$PWD/.vimrc"
        echo "set showmatch" >> "$PWD/.vimrc"
        echo "Vim configuration completed."
    } 2>&1 | tee -a "$LOGFILE" 
}


function set_alias(){
    {
        echo "Adding alias..."
        echo "alias update='sudo apt-get update && sudo apt-get upgrade -y'" >> "$USER_HOME/.bashrc"
        echo "alias myip='ip -o -4 addr show | awk \"{print \\\$2, \\\$4}\"'" >> "$USER_HOME/.bashrc"
        echo "alias gateway='ip r | awk \"/default/ {print \\\$3}\"'" >> "$USER_HOME/.bashrc"
        echo "Aliases added to .bashrc"
    } 2>&1 | tee -a "$LOGFILE" 
    echo "parse_git_branch() {
            git branch 2>/dev/null | sed -n '/\* /s///p'
        }

        export PS1='\[\e[32m\]\u@\h \[\e[34m\]\w\[\e[33m\] \$(parse_git_branch)\[\e[0m\] \$ '" >> "$USER_HOME/.bashrc"
}

function set_bashrc(){
    {
        echo "
            parse_git_branch() {
                git branch 2>/dev/null | sed -n '/\* /s///p'
            }

            export PS1='\[\e[32m\]\u@\h \[\e[34m\]\w\[\e[33m\] $(parse_git_branch)\[\e[0m\] \$'"
    } 2>&1 | tee -a "$LOGFILE" 
    source "$USER_HOME/.bashrc"
}

function set_git_config(){
    {
        echo "Setting git configuration..."
        git config --global user.email "crooper22@gmail.com"    
        git config --global user.name "Dmitri Donskoy"
        echo "Git configuration completed."
    } 2>&1 | tee -a "$LOGFILE"
}


configure_vim
set_alias
set_git_config
