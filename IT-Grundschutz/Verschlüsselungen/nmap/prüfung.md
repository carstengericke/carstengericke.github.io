nmap --script ssl-enum-ciphers -p 443 domino.inlakech.de

Starting Nmap 7.94 ( https://nmap.org ) at 2024-08-08 13:59 CEST
Nmap scan report for domino.inlakech.de (78.47.233.232)
Host is up (0.022s latency).
rDNS record for 78.47.233.232: static.232.233.47.78.clients.your-server.de

PORT    STATE SERVICE
443/tcp open  https
| ssl-enum-ciphers: 
|   TLSv1.2: 
|     ciphers: 
|       TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (ecdh_x25519) - A
|       TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 (dh 4096) - A
|       TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (ecdh_x25519) - A
|       TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 (dh 4096) - A
|     compressors: 
|       NULL
|     cipher preference: server
|     warnings: 
|       Key exchange (ecdh_x25519) of lower strength than certificate key
|_  least strength: A

Nmap done: 1 IP address (1 host up) scanned in 2.46 seconds
