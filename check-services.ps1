#!/bin/bash
# Propósito: Watchdog simple de servicios (Nginx, Docker, SSH, etc.)
# Verifica el estado de una lista de servicios críticos y los reinicia si están caídos

SERVICES=("nginx" "ssh" "docker")

for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$SERVICE"; then
        echo "[$(date)] $SERVICE está ejecutándose."
    else
        echo "[$(date)] $SERVICE está CAÍDO. Reiniciando..."
        systemctl start "$SERVICE"
        
        if systemctl is-active --quiet "$SERVICE"; then
            echo "[$(date)] $SERVICE reiniciado con éxito."
        else
            echo "[$(date)] ERROR: No se pudo reiniciar $SERVICE."
        fi
    fi
done
