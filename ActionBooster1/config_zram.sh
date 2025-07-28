#!/bin/bash
# Script para configurar zRAM automáticamente en Orange Pi
set -e

# Instalar zram-config si no está presente
if ! dpkg -s zram-config &> /dev/null; then
    sudo apt update
    sudo apt install -y zram-config
fi

# Configurar porcentaje de zRAM
ZRAM_CONF="/etc/default/zramswap"
if [ -f "$ZRAM_CONF" ]; then
    sudo sed -i 's/^PERCENT=.*/PERCENT=150/' "$ZRAM_CONF"
else
    echo "PERCENT=150" | sudo tee "$ZRAM_CONF"
fi

# Reiniciar servicio zram
sudo systemctl restart zramswap.service || sudo service zramswap restart

echo "zRAM configurado al 150% de la RAM física."
