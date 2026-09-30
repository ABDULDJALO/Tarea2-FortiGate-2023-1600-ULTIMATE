# Running-configs

| Archivo | Equipo | Cómo se obtuvo |
|---|---|---|
| `FGT.conf` | FortiGate | GUI: admin > Configuration > Backup > Local PC |
| `EDGE-CISCO-running-config.txt` | Router Cisco c7200 | `terminal length 0` + `show running-config` (clave IKE reemplazada por `*****`) |
| `ISP-running-config.txt` | Router ISP | `terminal length 0` + `show running-config` |
| `USUARIO-interfaces` | Alpine USUARIO | `cat /etc/network/interfaces` |
| `WEB-SRV-interfaces` | Alpine WEB-SRV | `cat /etc/network/interfaces` |
| `WEB-SRV-nginx-default.conf` | Alpine WEB-SRV | `cat /etc/nginx/http.d/default.conf` |

Borra este archivo cuando hayas agregado los que faltan.
