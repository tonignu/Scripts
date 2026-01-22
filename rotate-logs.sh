#!/bin/bash
# Propósito: Rotación manual de logs para aplicaciones personalizadas. Previene que los archivos .log llenen el disco

LOG_DIR="/var/log/myapp"
MAX_SIZE=10M # Tamaño máximo antes de rotar

if [ ! -d "$LOG_DIR" ]; then
    echo "El directorio $LOG_DIR no existe."
    exit 1
fi

for logfile in "$LOG_DIR"/*.log; do
    SIZE=$(du -h "$logfile" | cut -f1)
    if [[ $SIZE == *M* ]] && [ ${SIZE%M} -ge 10 ]; then
        mv "$logfile" "$logfile.$(date +%Y%m%d).old"
        touch "$logfile"
        chmod 644 "$logfile"
        echo "Rotado: $logfile ($SIZE)"
    fi
done
