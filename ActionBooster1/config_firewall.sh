#!/bin/bash
# Script para configurar firewall seguro por defecto
set -e

sudo apt update
sudo apt install -y ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 8080/tcp  # VS Code
sudo ufw allow 5000/tcp  # API Flask
sudo ufw allow 9090/tcp  # API paralela
sudo ufw enable

echo "Firewall configurado y activado."
