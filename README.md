![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-orange)
![Vagrant](https://img.shields.io/badge/Vagrant-Installed-blue)
![Bash](https://img.shields.io/badge/Bash-Scripts-green)

# Ubuntu Environment Setup Scripts

Welcome to the **Ubuntu Environment Setup Scripts** project! This repository contains a collection of Bash scripts designed to streamline the setup and configuration of an Ubuntu environment. Whether you're provisioning a virtual machine or configuring a user environment, these scripts have you covered.

---

## 📜 Scripts Overview

### 1. **global_env_script.sh**
   - Installs essential applications and dependencies for the environment.
   - Designed to be executed during the provisioning process.
   ### 2. **user_env_script.sh**

   - Configures user-specific settings and preferences.
   - Tailored for customizing the environment of a specific user after the global setup.
   - Should be run as the target user to apply configurations such as shell preferences, aliases, and environment variables.
   - Useful for personalizing the development environment or applying user-level tweaks.
   - Can be executed manually after provisioning is complete.  - Configures user-specific settings and preferences.
   - Tailored for the user whose environment needs customization.

### 3. **create_user_script.sh** *(Optional)*
   - Creates a new user in Ubuntu.
   - Ideal for scenarios where additional user accounts are required.

---

## 🚀 Usage Instructions
### **1. global_env_script.sh**
   - Automatically executed by Vagrant during provisioning.
   - Ensure Vagrant is installed and properly configured before running.

### **How to Run Vagrant**
   1. Install Vagrant by following the [official installation guide](https://developer.hashicorp.com/vagrant/docs/installation).
   2. Navigate to the project directory:
      ```bash
      cd /home/vagrant/linuxenv-setup
      ```
   3. Initialize and start the Vagrant environment:
      ```bash
      vagrant up
      ```
   4. SSH into the virtual machine:
      ```bash
      vagrant ssh
      ```
   5. The `global_env_script.sh` will run automatically during provisioning.
   ### **2. user_env_script.sh**
      - Run this script after completing the global environment setup.
      - Execute it as the user whose environment needs to be configured.

   #### **How to Run user_env_script.sh**
      1. SSH into the virtual machine:
         ```bash
         vagrant ssh
         ```
      2. Switch to the user whose environment needs to be configured (if necessary):
         ```bash
         su - <username>
         ```
      3. Navigate to the script's directory:
         ```bash
         cd /home/vagrant/linuxenv-setup
         ```
      4. Execute the script:
         ```bash
         bash user_env_script.sh
         ```

### **3. create_user_script.sh**
   - Use this script to create a new user account.
   - Follow the interactive prompts to complete the setup.

#### **How to Run create_user_script.sh**
   1. SSH into the virtual machine:
      ```bash
      vagrant ssh
      ```
   2. Navigate to the script's directory:
      ```bash
      cd /home/vagrant/linuxenv-setup
      ```
   3. Execute the script:
      ```bash
      bash create_user_script.sh
      ```
   4. Follow the on-screen prompts to create a new user account.

---

## ✅ Requirements

- **Operating System**: Ubuntu 24.04
- **Tools**: Vagrant (required for `global_env_script.sh`)

---

## 🤝 Contributing

Contributions are welcome! If you encounter any issues or have ideas for improvement, feel free to submit an issue or a pull request.

---

## 👤 Author

- **Dmitri Donskoy**
- 📧 Email: [crooper22@gmail.com](mailto:crooper22@gmail.com)

---
