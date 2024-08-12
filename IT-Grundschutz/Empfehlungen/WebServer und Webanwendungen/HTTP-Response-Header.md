### Technote: Absicherung von Webanwendungen durch geeignete HTTP-Response-Header

#### Zielsetzung
Diese Technote beschreibt die Implementierung von HTTP-Response-Headern zur Erhöhung der Sicherheit von Webanwendungen. Durch den Einsatz dieser Header können Angriffe wie Clickjacking, Cross-Site Scripting (XSS) und andere Bedrohungen effektiv verhindert werden. Die Empfehlungen richten sich an IT-Verantwortliche und Administratoren, die für die Sicherheit von Webanwendungen zuständig sind.

#### Hintergrund
Webanwendungen sind häufig Ziel von Angriffen, die darauf abzielen, sensible Daten zu stehlen oder die Kontrolle über die Anwendung zu übernehmen. Zu den gängigsten Angriffstechniken gehören Clickjacking und Cross-Site Scripting (XSS). Um diesen Bedrohungen entgegenzuwirken, sollten IT-Abteilungen geeignete HTTP-Response-Header konfigurieren und implementieren.

#### Sicherheitsempfehlungen

1. **Schutz vor Clickjacking**

   - **Angriffsbeschreibung:** Clickjacking ist eine Methode, bei der ein Angreifer die Oberfläche einer Webseite so manipuliert, dass Benutzer ungewollt auf versteckte Elemente klicken, was zu unerwünschten Aktionen führen kann.
   - **Empfohlener Header: `X-Frame-Options`**
     - **`DENY`**: Verhindert jegliche Einbettung der Seite in einen `<iframe>`.
     - **`SAMEORIGIN`**: Erlaubt die Einbettung nur, wenn die Anfrage von der gleichen Domain stammt.
     - **`ALLOW-FROM uri`**: Erlaubt die Einbettung von einer spezifischen URI.

2. **Schutz vor Cross-Site Scripting (XSS)**

   - **Angriffsbeschreibung:** XSS ermöglicht es Angreifern, bösartigen Code in eine Webanwendung einzubetten, der dann von anderen Benutzern ausgeführt wird. Dadurch können sensible Daten abgegriffen oder schädliche Aktionen ausgeführt werden.
   - **Empfohlene Header:**
     - **`Content-Security-Policy (CSP)`**: Einschränkung der Ressourcen, die von der Webanwendung geladen werden dürfen. Ein Beispiel für eine restriktive CSP könnte wie folgt aussehen:
       ```
       Content-Security-Policy: "default-src 'self'; script-src 'self' https://trusted.cdn.com"
       ```
     - **`X-XSS-Protection`**: Aktiviert den integrierten XSS-Schutz des Browsers und blockiert die Darstellung der Seite bei einem XSS-Versuch:
       ```
       X-XSS-Protection: "1; mode=block"
       ```

3. **Schutz vor weiteren Bedrohungen**

   - **`Strict-Transport-Security (HSTS)`**: Erzwingt die Verwendung von HTTPS und schützt so vor Man-in-the-Middle-Angriffen. Beispielkonfiguration:
     ```
     Strict-Transport-Security: "max-age=31536000; includeSubDomains"
     ```
   - **`X-Content-Type-Options`**: Verhindert das MIME-Sniffing durch den Browser, was potenziell gefährliche Inhalte blockiert:
     ```
     X-Content-Type-Options: "nosniff"
     ```
   - **`Referrer-Policy`**: Kontrolliert, welche Referrer-Informationen bei HTTP-Anfragen weitergegeben werden. Ein restriktiver Wert wäre:
     ```
     Referrer-Policy: "no-referrer"
     ```

4. **Steuerung des Caching-Verhaltens**

   - **Header: `Cache-Control`**
     - **Beschreibung:** `Cache-Control` ist ein HTTP-Header, der verwendet wird, um das Caching-Verhalten von Webinhalten zu steuern. Durch den Einsatz dieses Headers kann bestimmt werden, wie und wo Inhalte zwischengespeichert werden dürfen.
     - **Empfohlene Direktiven:**
       - **`no-store`**: Verhindert das Zwischenspeichern von Inhalten, was insbesondere für sensible Daten wichtig ist.
       - **`no-cache`**: Der Cache muss bei jedem Zugriff die Gültigkeit der Ressource überprüfen, bevor sie verwendet wird.
       - **`must-revalidate`**: Erzwingt, dass der Cache die Gültigkeit abgelaufener Ressourcen beim Server überprüft, bevor sie erneut verwendet werden.
       - **Beispielkonfiguration:**
         ```
         Cache-Control: no-cache, no-store, must-revalidate
         ```

#### Implementierungsbeispiel für Nginx

Hier ist eine Beispielkonfiguration für einen Nginx-Server, der die oben empfohlenen HTTP-Response-Header implementiert:

```
server {
    listen 443 ssl;
    server_name example.com;

    # Sicherheit durch HTTP-Response-Header
    add_header X-Frame-Options "DENY";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";
    add_header Referrer-Policy "no-referrer";
    add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' https://trusted.cdn.com;";
    add_header Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
    add_header Cache-Control "no-cache, no-store, must-revalidate";

    # Weitere Server-Konfigurationen...
}
```

#### Fazit
Durch die Implementierung der oben genannten HTTP-Response-Header können Webanwendungen signifikant besser gegen Angriffe geschützt werden. Es ist empfehlenswert, dass IT-Abteilungen diese Sicherheitsmaßnahmen aktiv in ihren Webserver-Konfigurationen einsetzen und regelmäßig überprüfen, um die Sicherheit der Webanwendung kontinuierlich zu gewährleisten. Der zusätzliche Einsatz von `Cache-Control` kann zudem sicherstellen, dass sensible Daten nicht unsicher zwischengespeichert werden und immer die aktuelle Version der Ressourcen verwendet wird.