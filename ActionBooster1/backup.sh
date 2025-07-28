#!/bin/bash
# Script de backup para ActionBooster
set -e

BACKUP_DIR="/Users/macbookm1/Documents/ActionBooster1/backups"
DATE=$(date +%F-%H%M)
mkdir -p "$BACKUP_DIR"

# Archivos y carpetas clave
TARGETS=(
    agent_app.py
    parallel_api.py
    autoconfig.py
    task_distributor.py
    requirements.txt
    var/www/prototype/
    .config/code-server/config.yaml
)

# Crear backup comprimido
tar -czf "$BACKUP_DIR/config-$DATE.tar.gz" ${TARGETS[@]}
echo "Backup creado en $BACKUP_DIR/config-$DATE.tar.gz"
