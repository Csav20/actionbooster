#!/bin/bash
# Script para iniciar servicios ActionBooster
set -e

source ai_env/bin/activate

# Iniciar agente multi-modelo en segundo plano
nohup python agent_app.py > agent.log 2>&1 &
AGENT_PID=$!
echo "Agente multi-modelo iniciado (PID $AGENT_PID)"

# Iniciar API paralela en segundo plano
nohup python parallel_api.py > parallel_api.log 2>&1 &
PARALLEL_PID=$!
echo "API paralela iniciada (PID $PARALLEL_PID)"

# Mostrar estado
ps -p $AGENT_PID,$PARALLEL_PID
