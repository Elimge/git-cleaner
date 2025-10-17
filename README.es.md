# Git Cleaner 🧹

[🇬🇧 English Version](README.md)

Un script de Bash que **automatiza la limpieza** de las credenciales globales de Git (`user.name` y `user.email`) en máquinas Linux compartidas.

Está diseñado con la filosofía "set-it-and-forget-it". Ejecútalo una vez, y se configurará a sí mismo para ejecutarse automáticamente en cada inicio del sistema.

---

## ✨ Características Principales

- **🚀 Instalación Automática**: Solo ejecuta el script una vez. Se añadirá automáticamente a `crontab` para ejecutarse en cada reinicio. ¡No necesitas editar nada manualmente!
- **🧹 Limpieza al Iniciar**: Se asegura de que la configuración global de Git de ningún usuario se quede guardada en el equipo tras un reinicio.
- **🔔 Notificaciones de Escritorio**: Envía una notificación de escritorio para confirmar que la revisión se ha completado.
- **🔒 Seguro de Usar**: Utiliza un archivo de bloqueo (`/tmp`) para que la lógica de limpieza solo se ejecute una vez al día, y es lo suficientemente inteligente como para no crear entradas duplicadas en `crontab`.

---

## 📂 Scripts Incluidos

| Archivo | Descripción |
|---------|-------------|
| `scripts/check_and_clean_git_config.sh` | **(Recomendado)** El script principal. Automatiza la instalación y la limpieza. **Este es el que deberías usar.** |
| `scripts/check_git_config.sh` | Una versión más simple y únicamente manual para limpiezas puntuales sin ninguna configuración de fondo. |

---

## ⚙️ Instalación y Configuración

Sigue estos pasos para tener la limpieza automatizada funcionando en tu sistema.

### 1. Clona el repositorio
```bash
git clone https://github.com/Elimge/git-cleaner.git
```

### 2. Navega y da permisos de ejecución
```bash
cd git-cleaner
chmod +x scripts/*.sh
```

### 3. Ejecuta el Script Principal una vez
```bash
bash scripts/check_and_clean_git_config.sh
```
La primera vez que lo ejecutes, se instalará a sí mismo en tu crontab y luego realizará la limpieza. ¡Eso es todo! A partir de ahora, se ejecutará automáticamente cada vez que inicies tu ordenador.

---

## ▶️ Uso

### Automatizado (Recomendado)
Después de seguir los pasos de instalación, no necesitas hacer nada más. El script se encargará de todo automáticamente en cada reinicio del sistema.

### Manual
Si prefieres una limpieza manual y puntual sin ninguna configuración en segundo plano, puedes usar el script más simple:
```bash
bash scripts/check_git_config.sh
```

## 🪪 Licencia
Licencia MIT – Eres libre de usar y modificar este script con la debida atribución.

---

## 💡 Autor
Creado por **Miguel Canedo Vanegas**, para mantener sistemas compartidos limpios y seguros.
* Github: [@Elimge](https://github.com/Elimge)
* **Email:** elimge@outlook.com
