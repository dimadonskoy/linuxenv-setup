![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-orange)
![Vagrant](https://img.shields.io/badge/Vagrant-Installed-blue)
![Bash](https://img.shields.io/badge/Bash-Scripts-green)

# Project: Ubuntu Installation Scripts

This project contains three Bash scripts designed for setting up an Ubuntu environment. Each script serves a specific purpose in the installation and configuration process.

## Scripts

1. **global_env_script.sh**

   - It installs all the necessary applications and dependencies required for the environment.

2. **user_env_script.sh**

   - This script configures the user environment.
   - It sets up user-specific settings and preferences.

3. **create_user_script.sh** (Optional)
   - This script is used to create a new user in Ubuntu.
   - It is optional and can be run if a new user needs to be added to the system.

## Usage

1. **global_env_script.sh**

   - Run by Vagrant during the provisioning process.
   - Ensure Vagrant is installed and configured properly.

2. **user_env_script.sh**

   - Execute this script after the global environment setup.
   - Run it as the user whose environment needs to be configured.

3. **create_user_script.sh**
   - Run this script if you need to create a new user.
   - Follow the prompts to set up the new user account.

## Requirements

- Ubuntu operating system version 24.04
- Vagrant installed (for running `global_env_script.sh`)

## Author

- Dmitri Donskoy
- crooper22@gmail.com

Feel free to contribute to this project by submitting issues or pull requests.
