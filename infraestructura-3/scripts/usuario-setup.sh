#!/bin/sh
# =====================================================================
# USUARIO - Alpine Linux 3.20 - Infraestructura 3
# Abdul Djalo - 2023-1600
# VLAN 10 con DHCP del Cisco + cliente SSL-VPN openfortivpn.
# Los comandos se ejecutaron uno por uno en la consola de PNetLab.
# =====================================================================

# --- VLAN 10 por DHCP ---
modprobe 8021q
echo "8021q" >> /etc/modules
printf 'auto lo\niface lo inet loopback\nauto eth0\niface eth0 inet manual\nauto eth0.10\niface eth0.10 inet dhcp\n' > /etc/network/interfaces
echo "USUARIO" > /etc/hostname
sync
# reboot

# --- Cliente SSL-VPN (solo disponible en edge/testing) y SSH ---
apk add ppp openssh-client
apk add openfortivpn --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing
modprobe ppp_generic
echo "ppp_generic" >> /etc/modules
sync

# --- Pruebas SIN VPN ---
wget --no-check-certificate -T 5 -qO- https://200.23.16.6   # funciona (VIP)
ssh -o ConnectTimeout=5 abdul@200.23.16.6                   # timeout
ssh -o ConnectTimeout=5 abdul@172.23.16.130                 # timeout
traceroute 200.23.16.6

# --- Diagnostico de la version TLS que acepta el FortiGate ---
echo | openssl s_client -connect 200.23.16.6:10443 -tls1 -cipher "DEFAULT:@SECLEVEL=0"

# --- Conexion SSL-VPN ---
# El FortiGate en evaluacion solo negocia TLS 1.0, por eso se usan
# --insecure-ssl, --min-tls=1.0 y un cipher compatible.
openfortivpn 200.23.16.6:10443 -u vpnuser -p '<CLAVE>' \
  --trusted-cert 286efc05555bc05560acbbb14928b35b93b7da0e6a47e1a6701bc983704f1190 \
  --insecure-ssl --min-tls=1.0 \
  --cipher-list "ECDHE-RSA-AES256-SHA:@SECLEVEL=0" > /tmp/vpn.log 2>&1 &
sleep 8
cat /tmp/vpn.log          # "Tunnel is up and running."

# --- Pruebas CON VPN ---
ip addr show ppp0         # IP del rango 10.23.16.10-20
ip route
ping -c 3 172.23.16.130
traceroute 172.23.16.130
ssh abdul@172.23.16.130

# --- Desconectar ---
killall openfortivpn
