#!/bin/bash
# Propósito: Backup automatizado con rotación de archivos
# Uso: ./backup-linux.sh /ruta/origen /ruta/destino

SOURCE=$1
DEST=$2
DATE=$(date +%Y-%m-%d_%H%M%S)
FILENAME="backup_$DATE.tar.gz"

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Argumentos insuficientes. Uso: $0 [ORIGEN] [DESTINO]"
    exit 1
fi

mkdir -p "$DEST"
tar -czf "$DEST/$FILENAME" "$SOURCE" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Backup completado: $DEST/$FILENAME"
    # Mantener solo los últimos 7 días de backups
    find "$DEST" -type f -name "backup_*.tar.gz" -mtime +7 -delete
else
    echo "Error al crear el backup."
fi
