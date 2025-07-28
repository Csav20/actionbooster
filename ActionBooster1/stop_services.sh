#!/bin/bash
# Script para detener servicios ActionBooster
set -e

# Detener procesos por nombre
pkill -f agent_app.py || echo "Agente ya detenido."
pkill -f parallel_api.py || echo "API paralela ya detenida."

# Confirmar
ps aux | grep -E 'agent_app.py|parallel_api.py' | grep -v grep || echo "Todos los servicios detenidos."
