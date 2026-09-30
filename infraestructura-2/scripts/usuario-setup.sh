#!/bin/sh
# =====================================================================
# USUARIO - Alpine Linux 3.20 - Infraestructura 2
# Abdul Djalo - 2023-1600
# Interfaz etiquetada en VLAN 10 con direccion por DHCP (EDGE-CISCO).
#
# Nota: en la consola de PNetLab los comandos se ejecutaron uno por uno,
# porque al pegar varias lineas a la vez se juntan en una sola.
# =====================================================================

# --- Soporte 802.1Q (VLAN) ---
modprobe 8021q
grep -q 8021q /etc/modules || echo "8021q" >> /etc/modules

# --- Configuracion persistente de red ---
printf 'auto lo\niface lo inet loopback\nauto eth0\niface eth0 inet manual\nauto eth0.10\niface eth0.10 inet dhcp\n' > /etc/network/interfaces

# --- Hostname ---
echo "USUARIO" > /etc/hostname
hostname USUARIO

# --- Forzar escritura en disco ---
sync

# --- Aplicar configuracion ---
rc-service networking restart

# --- Verificacion ---
ip addr show eth0.10
ping -c 3 172.23.16.1

# --- Pruebas hacia el servidor (a traves de la VPN) ---
ping -c 10 172.23.16.130
traceroute 172.23.16.130
wget --no-check-certificate -T 5 -qO- https://172.23.16.130
