# Git Cleaner 🧹

[🇨🇴 Versión en español](README.es.md)

A Bash script that **automates the cleaning** of global Git credentials (`user.name` and `user.email`) on shared Linux machines.

It's designed with a "set-it-and-forget-it" philosophy. Run it once, and it will configure itself to run automatically on every system startup.

---

## ✨ Key Features

- **🚀 Automatic Setup**: Just run the script once. It will automatically add itself to `crontab` to run on every reboot. No manual editing needed!
- **🧹 Cleans on Startup**: Ensures that no user's global Git config is left behind after a restart.
- **🔔 Desktop Notifications**: Sends a desktop notification to confirm that the check has been completed.
- **🔒 Safe to Run**: Uses a lock file (`/tmp`) to ensure the cleaning logic only runs once per day, and it's smart enough not to create duplicate entries in `crontab`.

---

## 📂 Scripts Included

| File | Description |
|------|-------------|
| `scripts/check_and_clean_git_config.sh` | **(Recommended)** The main script. Automates setup and cleaning. **This is the one you should use.** |
| `scripts/check_git_config.sh` | A simpler, manual-only version for one-time cleanups without any background setup. |

---

## ⚙️ Installation & Setup

Follow these steps to get the automated cleanup running on your system.

### 1. Clone the repository
```bash
git clone https://github.com/Elimge/git-cleaner.git
```

### 2. Navigate and Make Scripts Executable
```bash
cd git-cleaner
chmod +x scripts/*.sh
```

### 3. Run the Main Script Once
```bash
bash scripts/check_and_clean_git_config.sh
```
The first time you run it, it will install itself in your crontab and then perform the cleanup. That's it! From now on, it will run automatically every time you start your computer.

---

## ▶️ Usage

### Automated (Recommended)
After following the installation steps, you don't need to do anything else. The script will handle everything automatically on each system reboot.

### Manual
If you prefer a one-time, manual cleanup without any background setup, you can use the simpler script:
```bash
bash scripts/check_git_config.sh
```

## 🪪 License
MIT License – You’re free to use and modify this script with attribution.

---

## 💡 Author
Created by **Miguel Canedo Vanegas** – maintaining shared systems clean and secure.
* Github: [@Elimge](https://github.com/Elimge)
* **Email:** elimge@outlook.com
