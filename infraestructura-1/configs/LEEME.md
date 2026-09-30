# Running-configs

Archivos de esta carpeta:

| Archivo | Equipo | Cómo se obtuvo |
|---|---|---|
| `FGT-1.conf` | FortiGate 1 | GUI: admin > Configuration > Backup > Local PC |
| `FGT-2.conf` | FortiGate 2 | GUI: admin > Configuration > Backup > Local PC |
| `ISP-running-config.txt` | Router ISP | `copy running-config tftp:` hacia PNetLab (192.168.100.29) |
| `USUARIO-interfaces` | Alpine USUARIO | `cat /etc/network/interfaces` |
| `WEB-SRV-interfaces` | Alpine WEB-SRV | `cat /etc/network/interfaces` |
| `WEB-SRV-nginx-default.conf` | Alpine WEB-SRV | `cat /etc/nginx/http.d/default.conf` |
