#!/bin/bash
# Script para limpiar caché y archivos temporales de ActionBooster
set -e

# Limpiar caché de modelos llama.cpp
rm -rf ~/.cache/ggml/*

# Limpiar logs antiguos
find /Users/macbookm1/Documents/ActionBooster1/ -name '*.log' -type f -mtime +2 -delete

# Limpiar archivos temporales
find /tmp -name 'actionbooster_*' -type f -delete

echo "Caché y temporales limpiados."
