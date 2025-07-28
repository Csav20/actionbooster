#!/bin/bash
# Script de monitoreo para ActionBooster

# Mostrar uso de CPU, RAM y procesos relevantes
echo "--- USO DE CPU Y RAM ---"
top -b -n 1 | head -20

echo "--- USO DE DISCO ---"
df -h | grep -E '/$|/ssd'

echo "--- Procesos IA activos ---"
ps aux | grep -E 'agent_app.py|parallel_api.py' | grep -v grep

echo "--- Temperatura (si está disponible) ---"
if command -v sensors &> /dev/null; then
    sensors | head -10
else
    echo "Comando 'sensors' no disponible. Instala con: sudo apt install lm-sensors"
fi
