
[![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)

# Ubuntu Environment Setup Scripts

Welcome to the **Ubuntu Environment Setup Scripts** project! This repository contains a collection of Bash scripts designed to streamline the setup and configuration of an Ubuntu environment. Whether you're provisioning a virtual machine or configuring a user environment, these scripts have you covered.

---

  
### 1. **global_env_script.sh**
   - Installs essential applications and dependencies for the environment.
   - Designed to be executed during the provisioning process.

### 2. **user_env_script.sh**
   - Configures user-specific settings and preferences after the global environment setup.
   - Should be run as the target user to apply configurations such as shell preferences, aliases, and environment variables.
   - Useful for personalizing the development environment or applying user-level tweaks.
   - Can be executed manually after provisioning is complete.

   #### 📝 What it does

   - Sets up shell preferences (e.g., `.bashrc`, `.profile`)
   - Adds useful aliases and environment variables
   - Installs user-level tools or utilities
   - Applies customizations for the user's workflow

   #### ⚙️ Usage

   1. **SSH into the virtual machine:**
      ```bash
      vagrant ssh
      ```
   2. **Switch to the user whose environment you want to configure (if needed):**
      ```bash
      su - <username>
      ```
   3. **Navigate to the script directory:**
      ```bash
      cd /home/vagrant/linuxenv-setup
      ```
   4. **Run the script:**
      ```bash
      bash user_env_script.sh
      ```

   > **Tip:** Run this script after the global environment setup is complete to ensure all dependencies are in place.

### 3. **create_user_script.sh** *(Optional)*
   - Creates a new user in Ubuntu.
   - Ideal for scenarios where additional user accounts are required.

### 4. **deploy.sh**
   - Automates the deployment of the environment setup.
   - Runs both `global_env_script.sh` and `user_env_script.sh` in sequence.
   - Useful for quickly provisioning and configuring a new environment with a single command.
   - Can be customized to include additional deployment steps as needed.

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
