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
   - Tailored for the user whose environment needs customization.

### 3. **create_user_script.sh** *(Optional)*
   - Creates a new user in Ubuntu.
   - Ideal for scenarios where additional user accounts are required.

---

## 🚀 Usage Instructions

### **1. global_env_script.sh**
   - Automatically executed by Vagrant during provisioning.
   - Ensure Vagrant is installed and properly configured before running.

### **2. user_env_script.sh**
   - Run this script after completing the global environment setup.
   - Execute it as the user whose environment needs to be configured.

### **3. create_user_script.sh**
   - Use this script to create a new user account.
   - Follow the interactive prompts to complete the setup.

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

Thank you for using these scripts! Your feedback and contributions help make this project better.
