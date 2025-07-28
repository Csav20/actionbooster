#!/bin/bash
# Script de restauración para ActionBooster
set -e

BACKUP_DIR="/Users/macbookm1/Documents/ActionBooster1/backups"
LATEST=$(ls -t $BACKUP_DIR/config-*.tar.gz | head -1)

if [[ -z "$LATEST" ]]; then
    echo "No se encontró backup en $BACKUP_DIR"
    exit 1
fi

tar -xzf "$LATEST" -C /Users/macbookm1/Documents/ActionBooster1/
echo "Restauración completada desde $LATEST"
