### Technote: Sicheres Setzen von Cookies in Nginx Reverse Proxy

#### **Ziel:**
Diese Technote beschreibt, wie in einer Nginx-Reverse-Proxy-Konfiguration alle Cookies mit den Attributen `Secure`, `HttpOnly` und `SameSite` versehen werden können, um die Sicherheit der Webanwendung zu erhöhen. Diese Attribute schützen die Cookies vor potenziellen Angriffen wie Cross-Site Scripting (XSS) und Cross-Site Request Forgery (CSRF).

#### **Voraussetzungen:**
- **Nginx** muss installiert und als Reverse Proxy konfiguriert sein.
- **SSL/TLS-Zertifikate** müssen konfiguriert sein, um HTTPS-Verbindungen zu ermöglichen, da das `Secure`-Attribut nur über HTTPS funktioniert.
- Grundlegendes Verständnis der Nginx-Konfigurationsstruktur.

#### **Hintergrund:**
Cookies spielen eine zentrale Rolle bei der Sitzungsverwaltung, Authentifizierung und Benutzerverfolgung. Unsichere Konfigurationen können zu schwerwiegenden Sicherheitslücken führen. Durch die Verwendung der Attribute `Secure`, `HttpOnly` und `SameSite` wird sichergestellt, dass Cookies:
- Nur über sichere HTTPS-Verbindungen gesendet werden (`Secure`).
- Nicht durch clientseitiges JavaScript ausgelesen werden können (`HttpOnly`).
- Nur unter bestimmten Bedingungen bei Cross-Site-Anfragen gesendet werden (`SameSite`).

#### **Lösung:**
Die Nginx-Konfiguration wird so angepasst, dass alle Cookies, die von den Backend-Servern über den Reverse Proxy gesendet werden, die oben genannten Sicherheitsattribute erhalten.

#### **Schritte zur Implementierung:**

1. **Nginx-Konfigurationsdatei öffnen:**
   Öffne die Nginx-Konfigurationsdatei, die den entsprechenden Serverblock für deinen Reverse Proxy enthält. Diese Datei befindet sich normalerweise unter `/etc/nginx/nginx.conf` oder in einer spezifischen Konfigurationsdatei unter `/etc/nginx/sites-available/`.

2. **Konfiguration anpassen:**
   Füge die folgende Konfiguration zum Serverblock hinzu, um alle Cookies mit den Attributen `Secure`, `HttpOnly` und `SameSite` zu versehen:

   ```
   http {
       # Setze Cookie-Pfad-Attribute
       proxy_cookie_path / "/; Secure; HttpOnly; SameSite=Lax";

       server {
           listen 443 ssl;
           server_name example.com;

           ssl_certificate /path/to/your/certificate.crt;
           ssl_certificate_key /path/to/your/private.key;

           location / {
               proxy_pass http://backend_server;

               # Optional: Domain für Cookies anpassen
               proxy_cookie_domain backend.example.com example.com;

               # Modifiziere den Set-Cookie-Header, um die Sicherheitsattribute hinzuzufügen
               sub_filter 'Set-Cookie:' 'Set-Cookie:; Secure; HttpOnly; SameSite=Lax';
               sub_filter_once on;

               # Optional: Fehlerbehandlung aktivieren
               proxy_intercept_errors on;
               error_page 502 503 504 /custom_50x.html;
               location = /custom_50x.html {
                   root /path/to/error_pages;
               }
           }
       }
   }
   ```

   **Erklärung der Konfiguration:**
   - **proxy_cookie_path**: Fügt den Cookies die Attribute `Secure`, `HttpOnly` und `SameSite=Lax` hinzu.
   - **proxy_pass**: Leitet Anfragen an den Backend-Server weiter.
   - **sub_filter**: Modifiziert den `Set-Cookie`-Header, um die Sicherheitsattribute zu setzen.
   - **proxy_cookie_domain**: Passt die Domain für die Cookies an, falls dies erforderlich ist.
   - **proxy_intercept_errors** und **error_page**: Optionale Konfiguration für benutzerdefinierte Fehlerseiten.

3. **Konfiguration testen:**
   Bevor du die Konfiguration live schaltest, teste die Syntax der Konfigurationsdatei:

   ```
   sudo nginx -t
   ```

   Wenn keine Fehler gemeldet werden, lade die Nginx-Konfiguration neu:

   ```
   sudo systemctl reload nginx
   ```

4. **Überprüfung:**
   Überprüfe die gesetzten Cookies im Browser, um sicherzustellen, dass die Attribute korrekt hinzugefügt wurden. Öffne dazu die Entwicklerkonsole (F12) und gehe zum Tab „Netzwerk“. Überprüfe die `Set-Cookie`-Header, um sicherzustellen, dass `Secure`, `HttpOnly` und `SameSite` wie erwartet vorhanden sind.

#### **Zusätzliche Hinweise:**
- **Leistungsaspekte:** Die Verwendung der `sub_filter`-Direktive kann zu einem leichten Performance-Overhead führen, insbesondere bei großen Antworttexten. Teste die Auswirkungen auf die Leistung in deiner Umgebung.
- **Kompatibilität:** Stelle sicher, dass alle Backend-Server mit dieser Konfiguration kompatibel sind und dass die modifizierten Cookies keine unerwarteten Seiteneffekte haben.

#### **Fazit:**
Durch die Implementierung dieser Konfiguration stellst du sicher, dass alle Cookies, die über deinen Nginx-Reverse-Proxy gesendet werden, mit den empfohlenen Sicherheitsattributen versehen sind. Dies trägt wesentlich zur Erhöhung der Sicherheit deiner Webanwendung bei.