#!/bin/bash
# Script de autoinicio para ActionBooster1
set -e

cd "$(dirname "$0")"

# Configurar zRAM automáticamente
bash config_zram.sh

# Configurar firewall seguro
bash config_firewall.sh

# Generar certificado TLS si no existe
if [ ! -f certs/actionbooster.crt ] || [ ! -f certs/actionbooster.key ]; then
  bash generate_selfsigned_tls.sh
fi

# Lanzar monitorización avanzada (Grafana/Prometheus)
if [ -f start_grafana_prometheus.sh ]; then
  bash start_grafana_prometheus.sh
fi

source ai_env/bin/activate
nohup python agent_app.py > agent_app.log 2>&1 &
nohup python parallel_api.py > parallel_api.log 2>&1 &
echo "Servicios ActionBooster1 iniciados en segundo plano."
