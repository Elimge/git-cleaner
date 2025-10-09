# Git Cleaner 🧹

[🇪🇸 Versión en español](README.es.md)


A simple Bash utility for shared Linux environments to **automatically clean global Git credentials** (`user.name` and `user.email`).

## 🚀 Purpose

This script ensures that no user's Git global configuration remains stored on a shared machine (e.g., university lab or office PC).

It runs automatically on system startup (via `crontab`) and can also be executed manually.

---

## 📂 Files

| File | Description |
|------|--------------|
| `scripts/check_git_config.sh` | Manual script to clean global Git credentials. |
| `scripts/check_and_clean_git_config.sh` | Automated version with daily lock and desktop notification. |

---

## 🧠 How It Works

- Checks if `~/.gitconfig` contains global `user.name` or `user.email`.
- If found, unsets them using:
  ```bash
  git config --global --unset user.name
  git config --global --unset user.email
  ```
- Sends a desktop notification (`notify-send`) once done.
- Uses a lock file in `/tmp` to ensure it only runs **once per day**.

---

## ⚙️ Setup

### 1. Clone the repository
```bash
git clone https://github.com/Elimge/git-cleaner.git
cd git-cleaner
```

### 2. Make scripts executable
```bash
chmod +x scripts/*.sh
```

### 3. Add to crontab
Run:
```bash
crontab -e
```
Then add:
```bash
@reboot /bin/bash /home/$USER/scripts/check_and_clean_git_config.sh
```

---

## 🧩 Manual Use
```bash
bash scripts/check_git_config.sh
```

---

## 🪪 License
MIT License – You’re free to use and modify this script with attribution.

---

## 💡 Author
Created by **Miguel Canedo Vanegas** – maintaining shared systems clean and secure.
* GitHub: `@Elimge`
* **Email:** elimge@outlook.com
