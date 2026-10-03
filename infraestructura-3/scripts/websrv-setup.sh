#!/bin/sh
# =====================================================================
# WEB-SRV - Alpine Linux 3.20 - Infraestructura 3
# Abdul Djalo - 2023-1600
# IP estatica en la red de servidores /28 y servidor web nginx con HTTPS.
#
# Nota: en la consola de PNetLab los comandos se ejecutaron uno por uno,
# porque al pegar varias lineas a la vez se juntan en una sola.
# =====================================================================

# ---------------------------------------------------------------------
# Parte A: red
# ---------------------------------------------------------------------
printf 'auto lo\niface lo inet loopback\n\nauto eth0\niface eth0 inet static\n    address 172.23.16.130\n    netmask 255.255.255.240\n    gateway 172.23.16.129\n' > /etc/network/interfaces
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "WEB-SRV" > /etc/hostname
hostname WEB-SRV
sync

ip addr flush dev eth0
ifup eth0

# Verificacion
ip addr show eth0
ip route
ping -c 3 172.23.16.129
ping -c 3 8.8.8.8
ping -c 3 dl-cdn.alpinelinux.org

# ---------------------------------------------------------------------
# Parte B: nginx con HTTPS
# ---------------------------------------------------------------------
apk update
apk add nginx openssl openssh

mkdir -p /etc/nginx/ssl /var/www/html

# Certificado autofirmado (RSA 2048, 365 dias)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/web.key \
  -out /etc/nginx/ssl/web.crt \
  -subj "/CN=172.23.16.130"

# Pagina de prueba
echo '<h1>WEB-SRV - Infraestructura 3 - Abdul Djalo 2023-1600</h1>' > /var/www/html/index.html

# Sitio HTTPS
printf 'server {\n    listen 443 ssl;\n    server_name _;\n    ssl_certificate /etc/nginx/ssl/web.crt;\n    ssl_certificate_key /etc/nginx/ssl/web.key;\n    root /var/www/html;\n    index index.html;\n}\n' > /etc/nginx/http.d/default.conf

nginx -t
rc-update add nginx default
rc-service nginx start
sync

# Prueba local
wget --no-check-certificate -qO- https://172.23.16.130

# ---------------------------------------------------------------------
# Parte C: SSH (solo accesible a traves de la SSL-VPN)
# ---------------------------------------------------------------------
adduser -D abdul
passwd abdul
rc-update add sshd default
rc-service sshd start
sync
netstat -tln    # puertos 22 y 443 en LISTEN
