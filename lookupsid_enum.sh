#!/bin/bash

# Verifica que se hayan ingresado todos los argumentos necesarios
if [ "$#" -ne 4 ]; then
    echo "Uso: $0 <IP> <usuario> <contraseña> <dominio>"
    exit 1
fi

IP=$1
USER=$2
PASS=$3
DOMAIN=$4

OUTPUT="lookupsid_output.txt"
USERLIST="users_enum.txt"

echo "[*] Ejecutando impacket-lookupsid contra $IP con $DOMAIN/$USER..."
impacket-lookupsid "$DOMAIN/$USER:$PASS@$IP" > "$OUTPUT" 2>/dev/null

if [ ! -s "$OUTPUT" ]; then
    echo "[!] No se obtuvo salida. Verificá las credenciales o la conectividad."
    exit 1
fi

echo "[*] Extrayendo usuarios válidos (SidTypeUser)..."
grep 'SidTypeUser' "$OUTPUT" | awk -F'\\\\' '{print $2}' | awk '{print $1}' | sort -u > "$USERLIST"

echo "[+] Usuarios extraídos:"
cat "$USERLIST"

echo "[+] Archivo generado: $USERLIST"
