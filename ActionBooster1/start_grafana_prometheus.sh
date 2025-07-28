#!/bin/bash
# Script para instalar y lanzar Grafana + Prometheus para monitorización
set -e

sudo apt update
sudo apt install -y docker.io docker-compose

cat > docker-compose-monitor.yml <<EOF
version: '3'
services:
  prometheus:
    image: prom/prometheus
    ports:
      - "9091:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
EOF

touch prometheus.yml # Debes configurar los targets manualmente

docker-compose -f docker-compose-monitor.yml up -d

echo "Grafana disponible en http://localhost:3000, Prometheus en http://localhost:9091"
