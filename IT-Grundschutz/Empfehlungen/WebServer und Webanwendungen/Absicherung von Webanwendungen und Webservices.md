
### **Absicherung von Webanwendungen und Webservices**

Webanwendungen und Webservices SOLLTEN so konfiguriert sein, dass auf ihre Ressourcen und Funktionen ausschließlich über die vorgesehenen, abgesicherten Kommunikationspfade zugegriffen werden kann. Dies bedeutet:

1. **Ausschließliche Nutzung sicherer Kommunikationsprotokolle (HTTPS):**
   - Alle Zugriffe auf die Webanwendung oder den Webservice sollten über HTTPS erfolgen, um die Kommunikation zu verschlüsseln und so vor Man-in-the-Middle-Angriffen und Datenlecks zu schützen.
   - **Erzwingen von HTTPS:** HTTP-Anfragen sollten automatisch auf HTTPS umgeleitet werden, sodass ein direkter Zugriff über HTTP nicht möglich ist.

2. **Verhinderung von direktem Zugriff auf interne Ressourcen:**
   - Interne Ressourcen und Funktionen, die nicht für den öffentlichen Zugriff bestimmt sind, müssen durch Firewalls, Netzwerksicherheitsgruppen oder ähnliche Mechanismen geschützt werden, sodass nur autorisierte Zugriffe möglich sind.
   - Direkte Zugriffe auf Ressourcen über die IP-Adresse oder über nicht abgesicherte Pfade müssen verhindert werden.

3. **Verhinderung der Umgehung von Sicherheitsmechanismen:**
   - Alle direkten IP-Zugriffe sollten blockiert oder auf die richtige Domain umgeleitet werden.
   - Nur vorgesehene und abgesicherte API-Endpunkte dürfen zugänglich sein. Diese Endpunkte sollten durch Authentifizierungs- und Autorisierungsmechanismen geschützt werden.

4. **Sicherstellen, dass nur notwendige Ressourcen öffentlich zugänglich sind:**
   - Es sollte eine Minimierung der Angriffsfläche erfolgen, indem nur die wirklich notwendigen Ressourcen und Funktionen öffentlich zugänglich sind. Nicht benötigte Ressourcen sollten abgeschirmt oder entfernt werden.
   - Monitoring- und Logging-Mechanismen sollten implementiert sein, um unerlaubte Zugriffsversuche zu erkennen und zu protokollieren.

### **Ausnahme für Let's Encrypt Certbot:**

Let's Encrypt Certbot benötigt den Zugriff auf den HTTP-Port 80 für die Validierung und Erneuerung von SSL/TLS-Zertifikaten mittels der HTTP-01 Challenge. Daher sollte eine Ausnahme konfiguriert werden, die es Certbot erlaubt, auf diesen Port zuzugreifen.

#### Beispielkonfiguration für Nginx:

```nginx
server {
    listen 80;
    server_name example.com;

    # Ausnahme für Let's Encrypt Certbot
    location /.well-known/acme-challenge/ {
        root /var/www/html;  # Verzeichnis, das für die Challenge verwendet wird
    }

    # Alle anderen HTTP-Anfragen auf HTTPS umleiten
    location / {
        return 301 https://$host$request_uri;
    }
}

server {
    listen 443 ssl;
    server_name example.com;

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    # Weitere HTTPS-Konfigurationen
    location / {
        # Anwendungskonfigurationen
    }
}
```

### **Zusammenfassung:**

Die Konfiguration der Webanwendung oder des Webservices sollte sicherstellen, dass alle Zugriffe ausschließlich über HTTPS erfolgen, um die Sicherheit der Kommunikation zu gewährleisten. Eine Ausnahme wird jedoch für den Let's Encrypt Certbot gemacht, der den HTTP-Port 80 zur Validierung von Zertifikaten benötigt. Diese Ausnahme wird speziell für die `/.well-known/acme-challenge/`-Ressource konfiguriert, während alle anderen HTTP-Anfragen auf HTTPS umgeleitet werden. 

Dies stellt sicher, dass die Anwendung im normalen Betrieb sicher ist und gleichzeitig die automatische Zertifikatsverwaltung durch Certbot problemlos funktioniert.