#!/bin/bash
# Hace que el script se detenga inmediatamente si un comando falla.
set -e

# ======== CONFIGURACIÓN ========
# Define la ubicación y el nombre del archivo que se utilizará para verificar si el script ha sido ejecutado hoy.
LOCK_DIR="/tmp"
LOCK_FILE="$LOCK_DIR/git_cleaner_$(date +%Y-%m-%d).lock"

# ======== LÓGICA DE AUTO-INSTALACIÓN EN CRONTAB ========
# Obtiene la ruta absoluta de este script. Es crucial para que csrontab lo encuentre sin importar desde dónde se ejecute.
SCRIPT_PATH="$(readlink -f "$0")"
# Define la tarea (job) que se debe añadir a crontab.
CRON_JOB="@reboot /bin/bash \"$SCRIPT_PATH\""

# Verifica si la tarea ya existe en el crontab del usuario.
# crontab -l: lista las tareas actuales.
# 2>/dev/null: suprime errores si el usuario no tiene un crontab previo.
# grep -Fq: busca una cadena fija (-F) y lo hace en modo silencioso (-q).
if ! crontab -l 2>/dev/null | grep -Fq -- "$CRON_JOB"; then
    echo "Configurando el script para que se ejecute en cada reinicio..."
    # Si no existe, lo añade. Esta es la forma segura de añadir una tarea sin borrar las existentes.
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "¡Listo! El script ahora se ejecutará automáticamente."
else
    echo "La configuración de ejecución automática ya existe en crontab."
fi

# ======== LÓGICA DE BLOQUEO ========
# Verifica si el archivo de bloqueo para el día de hoy ya existe.
if [ -f "$LOCK_FILE" ]; then
    # Si existe, imprime un mensaje y sale del script.
    echo "El script de limpieza de Git ya se ejecutó hoy. No se tomarán acciones."
    exit 0
fi

# ======== EJECUCIÓN DEL SCRIPT ========
# Si el archivo de bloqueo no existe, lo crea para evitar futuras ejecuciones hoy.
touch "$LOCK_FILE"

# Exporta variables de entorno necesarias para que las notificaciones de escritorio funcionen.
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Función para verificar y eliminar una configuración global de Git.
unset_git_config() {
    # El primer argumento ($1) corresponde a la clave de configuración que se va a verificar (por ejemplo: "user.name").
    local config_key="$1"

    # Verifica si la clave de configuración existe. La salida se redirige a /dev/null para no mostrarla.
    if git config --global --get "$config_key" >/dev/null 2>&1; then
        echo "Configuración global de '$config_key' encontrada. Eliminando..."
        git config --global --unset "$config_key"
    else
        echo "No se encontró configuración global para '$config_key'."
    fi
}

echo "--- Iniciando revisión de la configuración global de Git ---"
# Llama a la función para cada clave que se desea limpiar.
unset_git_config "user.name"
unset_git_config "user.email"
echo "--- Revisión finalizada ---"

# ======== NOTIFICACIÓN ========
# Define el mensaje que se va a mostrar en la notificación de escritorio
NOTIFICATION_MESSAGE="Se ha verificado la configuración de Git. Las credenciales globales fueron eliminadas si existían."

# Envía la notificación de escritorio.
# Se añade una comprobación para ver si el comando notify-send existe antes de usarlo.
if command -v notify-send &> /dev/null; then
    notify-send "Limpieza de Git completada" "$NOTIFICATION_MESSAGE" -i "utilities-terminal"
fi

