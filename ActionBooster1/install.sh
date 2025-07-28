#!/bin/bash
# Script de instalación para ActionBooster Universal
set -e

# Crear entorno virtual
python3 -m venv ai_env
source ai_env/bin/activate

# Instalar dependencias Python
pip install --upgrade pip
pip install flask flask-cors llama-cpp-python scikit-learn numpy

# Instalar dependencias del sistema
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt update
    sudo apt install -y build-essential python3-venv python3-pip
fi

# Mensaje final
cat <<EOF

Instalación completada.
- Activa el entorno: source ai_env/bin/activate
- Ejecuta el agente: python agent_app.py
- Ejecuta el API paralela: python parallel_api.py

EOF
