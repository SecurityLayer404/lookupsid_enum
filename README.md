# SID User Enumerator

Este script en Bash automatiza la enumeración de usuarios válidos en entornos Windows utilizando el módulo `lookupsid` de [Impacket](https://github.com/SecureAuthCorp/impacket). Está pensado para actividades de **pentesting** y **CTFs**, permitiendo extraer usuarios del dominio a partir de un SID base y volcarlos a una lista.

## 🛠 Requisitos

- Python instalado
- [Impacket](https://github.com/SecureAuthCorp/impacket) correctamente instalado
- Acceso válido al servicio (puerto 445/TCP abierto y credenciales válidas)

## 📌 Uso

```bash
./lookupsid_enum.sh <IP> <usuario> <contraseña> <dominio>
```

### Parámetros:

- `<IP>`: Dirección IP del controlador de dominio o servidor Windows
- `<usuario>`: Usuario con permisos para autenticarse
- `<contraseña>`: Contraseña del usuario 
- `<dominio>`: Dominio al que pertenece el usuario

### Ejemplos:

```bash
./lookupsid_enum.sh 192.168.1.10 juan p@ssw0rd EMPRESA.local

./lookupsid_enum.sh 192.168.1.10 guest '' EMPRESA.local
```

## 📌 Salida

El script genera dos archivos:

- `lookupsid_output.txt`: Resultado completo del comando `lookupsid`
- `users_enum.txt`: Lista limpia de usuarios válidos extraídos (`SidTypeUser`)

## 📌 Ejemplo de salida:

```
[*] Ejecutando impacket-lookupsid contra 192.168.1.10 con EMPRESA/juan...
[*] Extrayendo usuarios válidos (SidTypeUser)...
[+] Usuarios extraídos:
usuario1
usuario2
usuario3
[+] Archivo generado: users_enum.txt
```

## ⚠️ Advertencia

Este script es para **fines educativos y de pruebas autorizadas únicamente**. El uso no autorizado puede ser ilegal.

## 🕷 Autor

By Security Layer
