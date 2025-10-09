# Git Cleaner 🧹

Una utilidad simple en **Bash** para entornos Linux compartidos que **elimina automáticamente las credenciales globales de Git** (`user.name` y `user.email`).

---

## 🚀 Propósito

Este script garantiza que ninguna configuración global de Git quede guardada en un equipo compartido (por ejemplo, un laboratorio, oficina o computador público).

Se ejecuta automáticamente al iniciar el sistema (mediante `crontab`) y también puede usarse manualmente.

---

## 📂 Archivos

| Archivo | Descripción |
|----------|--------------|
| `scripts/check_git_config.sh` | Script manual para limpiar credenciales globales de Git. |
| `scripts/check_and_clean_git_config.sh` | Versión automatizada con bloqueo diario y notificación de escritorio. |

---

## 🧠 Cómo funciona

- Verifica si `~/.gitconfig` contiene `user.name` o `user.email` globales.
- Si existen, los elimina con:
  ```bash
  git config --global --unset user.name
  git config --global --unset user.email
  ```
- Envía una notificación de escritorio (`notify-send`) al finalizar.
- Crea un archivo de bloqueo en `/tmp` para asegurarse de ejecutarse **solo una vez por día**.

---

## ⚙️ Instalación y uso

### 1. Clonar el repositorio
```bash
git clone https://github.com/elimge/git-cleaner.git
cd git-cleaner
```

### 2. Dar permisos de ejecución
```bash
chmod +x scripts/*.sh
```

### 3. Agregar a crontab
Abre el crontab:
```bash
crontab -e
```
Agrega esta línea:
```bash
@reboot /bin/bash /home/$USER/scripts/check_and_clean_git_config.sh
```

---

## 🧩 Uso manual
```bash
bash scripts/check_git_config.sh
```

---

## 🪪 Licencia
Licencia MIT – puedes usar y modificar este script libremente, siempre con atribución.

---

## 💡 Autor
Creado por **Miguel Canedo Vanegas**, para mantener sistemas compartidos limpios y seguros.
* GitHub: `@Elimge`
* **Email:** elimge@outlook.com