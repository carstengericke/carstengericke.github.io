### Server vor Überlastungen schützen

#### **Motivation**

In einer Umgebung, in der Du einen E-Mail-Server (z. B. HCL Domino) betreibst, ist es wichtig, den Server vor Überlastungen zu schützen, insbesondere vor Denial-of-Service (DoS)-Angriffen. Diese Angriffe können darauf abzielen, den Server durch eine große Anzahl gleichzeitiger Verbindungen lahmzulegen. Eine effektive Methode, um solchen Angriffen vorzubeugen, ist die Begrenzung der Anzahl gleichzeitiger Verbindungen, die von einer einzelnen IP-Adresse ausgehen dürfen.

Gleichzeitig gibt es legitime Szenarien, in denen bestimmte IP-Adressen, etwa interne Server oder vertrauenswürdige Partner, eine höhere Anzahl gleichzeitiger Verbindungen benötigen. Beispielsweise könnten diese IP-Adressen von anderen Servern stammen, die E-Mail-Dienste für eine große Anzahl von Benutzern bereitstellen oder aus anderen Gründen eine hohe Anzahl von Verbindungen rechtfertigen.

Die Konfiguration, die hier vorgestellt wird, bietet eine Lösung, die es ermöglicht, den Großteil der IP-Adressen auf eine niedrigere Anzahl gleichzeitiger Verbindungen zu beschränken, während gleichzeitig bestimmte, vertrauenswürdige IP-Adressen von dieser Beschränkung ausgenommen werden und eine höhere Verbindungsgrenze erhalten.

#### **Erklärung der Konfiguration**

1. **`limit_conn_zone $binary_remote_addr zone=perip:10m;`**

   Diese Directive erstellt eine Zone namens `perip`, in der Nginx die Anzahl der Verbindungen pro IP-Adresse verfolgt. Der Speicherplatz für diese Zone wird auf 10 MB festgelegt. Die Verwendung von `$binary_remote_addr` sorgt dafür, dass die IP-Adresse des Clients in einer kompakten, binären Form gespeichert wird, was Speicherplatz spart und die Verarbeitung effizienter macht.

   **Warum ist das wichtig?**  
   Diese Zone ist notwendig, um Nginx in die Lage zu versetzen, die Anzahl gleichzeitiger Verbindungen pro IP-Adresse zu verfolgen und entsprechend zu limitieren.

2. **`map $remote_addr $limit`**

   Die `map`-Directive ermöglicht es, unterschiedliche Werte für die Verbindungsgrenze (`$limit`) basierend auf der IP-Adresse des Clients (`$remote_addr`) festzulegen. Der `default`-Wert ist auf 10 gesetzt, was bedeutet, dass die meisten IP-Adressen auf 10 gleichzeitige Verbindungen beschränkt werden. Für bestimmte, in der `map` aufgeführte IP-Adressen, wie `192.168.1.10`, wird eine höhere Grenze von 1000 Verbindungen festgelegt.

   **Warum ist das wichtig?**  
   Mit dieser Einstellung kannst Du eine differenzierte Kontrolle über den eingehenden Traffic ausüben. IP-Adressen, denen Du vertraust oder die mehr Ressourcen benötigen, können von den strengeren Einschränkungen ausgenommen werden. Dies ist nützlich in Szenarien, in denen bestimmte Server, wie z. B. interne E-Mail-Gateways, mehr gleichzeitige Verbindungen benötigen, ohne die Gefahr einer Überlastung zu riskieren.

3. **`limit_conn perip $limit`**

   Diese Directive wendet die zuvor festgelegte Verbindungsgrenze auf die eingehenden Verbindungen an. Für jede der definierten Protokolle (SMTP, IMAP, POP3) wird überprüft, wie viele Verbindungen von einer bestimmten IP-Adresse bestehen. Basierend auf dem Wert von `$limit` (der durch die `map`-Directive festgelegt wird), wird Nginx die Verbindungen entweder zulassen oder blockieren, wenn das Limit überschritten wird.

   **Warum ist das wichtig?**  
   Diese Einstellung ist der Kern der Verbindungsbegrenzung. Sie stellt sicher, dass keine einzelne IP-Adresse den Server durch zu viele gleichzeitige Verbindungen überlasten kann. Gleichzeitig ermöglicht es den Ausnahme-IP-Adressen, die benötigten Ressourcen zu erhalten.

4. **`server`-Blöcke für SMTP, IMAP und POP3**

   Für jedes der Protokolle (SMTP, IMAP, POP3) wird ein eigener `server`-Block definiert, der auf den entsprechenden Port lauscht und eingehende Verbindungen an den dahinterliegenden E-Mail-Server weiterleitet. Die `limit_conn`-Directive wird in jedem dieser Blöcke angewendet, um sicherzustellen, dass die Verbindungsgrenzen unabhängig vom verwendeten Protokoll durchgesetzt werden.

   **Warum ist das wichtig?**  
   Diese Protokoll-spezifische Konfiguration stellt sicher, dass der Schutz gegen Überlastungen für alle relevanten E-Mail-Dienste gilt. Egal ob E-Mails über SMTP gesendet oder über IMAP/POP3 abgerufen werden, die Server bleiben vor potenziellen DoS-Angriffen geschützt.

### Fazit

Diese Nginx-Konfiguration bietet eine ausgewogene Lösung, die es ermöglicht, den Server vor Überlastungen und DoS-Angriffen zu schützen, während gleichzeitig bestimmten vertrauenswürdigen IP-Adressen mehr Ressourcen zur Verfügung gestellt werden. Sie ist besonders nützlich in komplexen IT-Umgebungen, in denen sowohl Sicherheit als auch Flexibilität gefordert sind. Durch die Begrenzung der Verbindungen für die Mehrheit der IP-Adressen und die Erhöhung der Grenzen für bestimmte IP-Adressen kannst Du sicherstellen, dass der Server stabil und sicher bleibt, ohne legitime Nutzungsanforderungen zu behindern.


Hier ist ein Beispiel für eine erweiterte Nginx-Konfiguration:

### Nginx-Konfiguration

```nginx
stream {
    log_format basic '$remote_addr [$time_local] $protocol $status $bytes_sent $bytes_received $session_time';
    access_log /var/log/nginx/stream.log basic;

    # Define the default connection limit (e.g., 10 for IMAP/POP3, 20 for SMTP)
    limit_conn_zone $binary_remote_addr zone=perip:10m;

    # Map to set different limits based on IP address
    map $remote_addr $limit {
        default          10;   # Default limit for unknown IPs
        192.168.1.10     1000; # Example of a whitelisted IP with higher limit
        192.168.1.11     1000; # Another example of a whitelisted IP
        203.0.113.42     1000; # Yet another example
    }

    server {
        listen 25;
        proxy_pass your.smtp.server:25;
        limit_conn perip $limit;
    }

    server {
        listen 143;
        proxy_pass your.imap.server:143;
        limit_conn perip $limit;
    }

    server {
        listen 110;
        proxy_pass your.pop3.server:110;
        limit_conn perip $limit;
    }
}
```

### Erklärung der Konfiguration

1. **`map` Directive**:
   - Die `map`-Directive wird verwendet, um verschiedene Verbindungsgrenzen für verschiedene IP-Adressen zu definieren.
   - In diesem Beispiel wird der `$limit`-Wert dynamisch basierend auf der IP-Adresse des Clients gesetzt.
   - IP-Adressen, die in der `map` aufgeführt sind (z. B. `192.168.1.10`), erhalten eine höhere Verbindungsgrenze (1000 gleichzeitige Verbindungen), während alle anderen IP-Adressen die Standardgrenze (10) erhalten.

2. **`limit_conn` Directive**:
   - Die `limit_conn`-Directive wird verwendet, um die Anzahl gleichzeitiger Verbindungen basierend auf dem Wert von `$limit` zu begrenzen.
   - Diese Einstellung wird in jedem `server`-Block (SMTP, IMAP, POP3) angewendet.

3. **Zonen-Konfiguration**:
   - `limit_conn_zone $binary_remote_addr zone=perip:10m;` definiert den Speicherbereich (`zone`), in dem Nginx die Verbindungen pro IP-Adresse verfolgt. Dieser Speicherbereich (`10m`) reicht für die Verwaltung vieler Verbindungen.

### Weitere Anpassungen

- Du kannst die Liste der IP-Adressen in der `map`-Directive erweitern, um weiteren spezifischen IP-Adressen erhöhte Verbindungsgrenzen zu gewähren.
- Der `default`-Wert in der `map`-Directive bestimmt die Verbindungsgrenze für alle anderen IP-Adressen, die nicht explizit in der Liste aufgeführt sind.
