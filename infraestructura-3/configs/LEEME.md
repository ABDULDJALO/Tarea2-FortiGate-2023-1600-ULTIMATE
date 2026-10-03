# Running-configs

| Archivo | Equipo | Cómo se obtiene |
|---|---|---|
| `FGT.conf` | FortiGate | GUI: admin > Configuration > Backup > Local PC *(agregar)* |
| `EDGE-CISCO-running-config.txt` | Router Cisco c2691 | `terminal length 0` + `show running-config` *(agregar)* |
| `ISP-running-config.txt` | Router ISP | `terminal length 0` + `show running-config` *(agregar)* |
| `USUARIO-interfaces` | Alpine USUARIO | `cat /etc/network/interfaces` |
| `WEB-SRV-interfaces` | Alpine WEB-SRV | `cat /etc/network/interfaces` |
| `WEB-SRV-nginx-default.conf` | Alpine WEB-SRV | `cat /etc/nginx/http.d/default.conf` |

Borra este archivo cuando hayas agregado los que faltan.
