#!/bin/bash
# Script para generar certificado TLS autofirmado para ActionBooster
set -e

mkdir -p certs
openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout certs/actionbooster.key \
    -out certs/actionbooster.crt \
    -subj "/CN=actionbooster.local"

echo "Certificado TLS generado en ./certs/"
