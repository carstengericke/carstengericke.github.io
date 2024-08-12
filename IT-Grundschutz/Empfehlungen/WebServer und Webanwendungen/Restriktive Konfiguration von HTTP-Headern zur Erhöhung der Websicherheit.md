### Technote: Restriktive Konfiguration von HTTP-Headern zur Erhöhung der Websicherheit

#### **Ziel:**
Diese Technote beschreibt, wie HTTP-Header auf einem Webserver oder Reverse Proxy restriktiv konfiguriert werden sollten, um die Sicherheit der Webanwendung zu erhöhen. Durch das Minimieren von Informationen und das Einsetzen sicherheitsrelevanter Header kann die Angriffsfläche reduziert und die Integrität der Webanwendung verbessert werden.

#### **Hintergrund:**
HTTP-Header transportieren wichtige Metainformationen zwischen einem Client (Browser) und einem Webserver. Während einige Header notwendig sind, um die Kommunikation zu ermöglichen, können andere Informationen preisgeben, die von Angreifern ausgenutzt werden könnten. Beispielsweise könnten Versionsnummern von Software oder unnötige Header potenzielle Sicherheitsrisiken darstellen.

**Best Practice** ist es daher, unnötige Header zu entfernen und sicherheitsrelevante Header zu setzen, um die Anfälligkeit für Angriffe wie Cross-Site Scripting (XSS), Cross-Site Request Forgery (CSRF) und Clickjacking zu minimieren.

#### **Schritte zur Implementierung:**

### 1. **Entfernen unnötiger HTTP-Header:**

Einige Standard-HTTP-Header können Informationen über den Webserver preisgeben, die Angreifern helfen könnten, Schwachstellen zu identifizieren.

- **Server-Header**: Dieser Header gibt die Webserver-Software und deren Version an.
- **X-Powered-By-Header**: Gibt die zugrunde liegende Technologie (z. B. PHP, ASP.NET) an.

**Beispielkonfiguration in Nginx:**

```
server {
    # Entfernt den Server-Header
    server_tokens off;

    # Entfernt den X-Powered-By Header
    proxy_hide_header X-Powered-By;

    location / {
        proxy_pass http://backend_server;
    }
}
```

### 2. **Setzen sicherheitsrelevanter HTTP-Header:**

Durch das Setzen bestimmter Header kann die Sicherheit der Webanwendung erheblich gesteigert werden. Diese Header schützen vor gängigen Angriffsvektoren.

- **Strict-Transport-Security (HSTS)**: Erzwingt die Nutzung von HTTPS, indem es dem Browser mitteilt, dass er nur über HTTPS auf die Website zugreifen darf.
  
- **X-Content-Type-Options**: Verhindert das MIME-Type-Sniffing durch den Browser, das zu XSS-Angriffen führen kann.
  
- **X-Frame-Options**: Verhindert Clickjacking, indem es das Einbetten der Seite in Frames von anderen Websites blockiert.
  
- **Content-Security-Policy**: Definiert, von welchen Quellen Inhalte (z. B. Skripte, Bilder) geladen werden dürfen, um XSS-Angriffe zu verhindern.
  
- **Referrer-Policy**: Bestimmt, welche Referrer-Informationen an andere Seiten gesendet werden, um ungewollte Informationsweitergabe zu vermeiden.

**Beispielkonfiguration in Nginx:**

```
server {
    listen 443 ssl;
    server_name example.com;

    ssl_certificate /path/to/your/certificate.crt;
    ssl_certificate_key /path/to/your/private.key;

    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
    add_header X-Content-Type-Options nosniff;
    add_header X-Frame-Options DENY;
    add_header Content-Security-Policy "default-src 'self'; script-src 'self' https://trustedscripts.example.com";
    add_header Referrer-Policy "no-referrer";

    location / {
        proxy_pass http://backend_server;
    }
}
```

### 3. **Beschränkung von Cross-Origin Requests:**

Cross-Origin Resource Sharing (CORS) kann ein Sicherheitsrisiko darstellen, wenn es nicht richtig konfiguriert ist. Header wie `Access-Control-Allow-Origin` und `Access-Control-Allow-Methods` sollten so restriktiv wie möglich konfiguriert werden, um zu verhindern, dass unerwünschte Anfragen aus anderen Domänen bearbeitet werden.

- **Access-Control-Allow-Origin**: Sollte auf spezifische, vertrauenswürdige Domains beschränkt werden, anstatt Anfragen von allen Domains (`*`) zuzulassen.
  
- **Access-Control-Allow-Methods**: Sollte nur die HTTP-Methoden erlauben, die wirklich benötigt werden (z. B. `GET`, `POST`).

**Beispielkonfiguration in Nginx:**

```
server {
    listen 443 ssl;
    server_name example.com;

    location /api/ {
        # Nur spezifische Domains dürfen auf die API zugreifen
        add_header Access-Control-Allow-Origin "https://trustedwebsite.com";
        # Nur GET und POST Anfragen erlauben
        add_header Access-Control-Allow-Methods "GET, POST";
    }
}
```

### 4. **Konfiguration testen:**

Nach dem Anpassen der Nginx-Konfiguration ist es wichtig, diese auf Fehler zu prüfen und sicherzustellen, dass sie wie erwartet funktioniert.

**Testen der Konfiguration:**

```
sudo nginx -t
```

Falls keine Fehler gemeldet werden, kann die neue Konfiguration geladen werden:

```
sudo systemctl reload nginx
```

**Überprüfen der Header im Browser:**

Öffne die Entwicklerkonsole (F12) im Browser und gehe zum Tab „Netzwerk“, um die gesetzten HTTP-Header für eine Anfrage zu überprüfen. Stelle sicher, dass die Header wie gewünscht gesetzt wurden.

#### **Zusammenfassung:**

Durch das restriktive Setzen von HTTP-Headern kannst du die Sicherheit deiner Webanwendung erheblich erhöhen. Dies beinhaltet das Entfernen unnötiger Header, das Setzen sicherheitsrelevanter Header und die Beschränkung von Cross-Origin Requests. Eine gut konfigurierte Nginx-Instanz mit restriktiven Headern trägt dazu bei, das Risiko von Angriffen zu minimieren und sensible Informationen zu schützen.