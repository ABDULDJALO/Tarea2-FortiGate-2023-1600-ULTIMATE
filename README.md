# Tarea 2 — FortiGate: VPN Site-to-Site, NAT y servicios

**Estudiante:** Abdul Djalo · **Matrícula:** 2023-1600

## 🎥 Video demostrativo

[![Video demostrativo](infraestructura-1/imagenes/miniatura-video.png)](https://youtu.be/REEMPLAZAR-CON-TU-ENLACE)

> Enlace directo: https://youtu.be/REEMPLAZAR-CON-TU-ENLACE

---

## Propósito del laboratorio

Diseñar, configurar y demostrar infraestructuras de red protegidas con firewalls FortiGate, aplicando configuración de red, NAT, VLAN, DHCP y VPN IPsec site-to-site. Toda la configuración de los FortiGate se realiza y demuestra por GUI, y cada infraestructura incluye pruebas que verifican su funcionamiento.

## Contenido

| Infraestructura | Descripción | Carpeta |
|---|---|---|
| 1 | Usuario y servidor web comunicados únicamente a través de una VPN IPsec site-to-site entre dos FortiGate | [infraestructura-1](infraestructura-1/README.md) |
| 2 | Usuario detrás de un router Cisco y servidor detrás de un FortiGate, comunicados por VPN IPsec site-to-site entre fabricantes distintos | [infraestructura-2](infraestructura-2/README.md) |
| 3 | *Pendiente* | [infraestructura-3](infraestructura-3/README.md) |

## Entorno utilizado

| Componente | Detalle |
|---|---|
| Host | Intel i5, 8 GB RAM DDR3, HDD 1 TB, Windows 10 Pro |
| Hipervisor | VMware Workstation (VM de PNetLab: 5 GB RAM, 4 vCPU, VT-x/EPT anidado) |
| Emulador | PNetLab, red en modo Bridged hacia la red de casa (192.168.100.0/24) |
| Firewalls | FortiGate-VM 7.0.9 (build 0444) |
| Routers Cisco | C2691 (IOS 12.4(25d)) como ISP · c7200 (IOS 15.2(4)S6) como equipo de red en la Infraestructura 2 |
| Hosts | Alpine Linux 3.20 |
| Herramientas | MobaXterm (SSH/SFTP), PuTTY (Telnet), navegador web |

## Estructura del repositorio

```
├── README.md                  ← este archivo (video + índice)
├── infraestructura-1/
│   ├── README.md              ← documentación completa
│   ├── diagramas/             ← diagramas de la topología
│   ├── imagenes/              ← capturas de configuración y pruebas
│   ├── configs/               ← running-configs de todos los equipos
│   └── scripts/               ← scripts y comandos utilizados
├── infraestructura-2/         ← misma estructura
└── infraestructura-3/         ← misma estructura
```
