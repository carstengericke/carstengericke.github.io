
HCL Domino unterstützt nativ **DKIM** (DomainKeys Identified Mail) ab Version 12.0.1. Diese Integration ermöglicht es, ausgehende E-Mails direkt mit DKIM zu signieren, um die Authentizität und Integrität der E-Mails sicherzustellen. Die Konfiguration erfolgt über den Domino-Server, einschließlich der Erstellung von DKIM-Schlüsseln und der Anpassung der `notes.ini` Datei. Dadurch kann HCL Domino E-Mails signieren, ohne dass externe Gateways erforderlich sind. 

Für weitere Details kannst Du die [offizielle Dokumentation](https://help.hcl-software.com/domino/14.0.0/admin/conf_dkimsigning.html) einsehen.

**SPF** (Sender Policy Framework) wird ab HCL Domino Version 12 nativ unterstützt. Man kann den Domino SMTP-Server so konfigurieren, dass er SPF-Prüfungen durchführt, um die Authentizität von eingehenden E-Mails zu überprüfen. Diese Funktion ermöglicht es dem Domino-Server, zu prüfen, ob der sendende Server berechtigt ist, E-Mails für die angegebene Domain zu versenden, und hilft somit, E-Mail-Spoofing und Spam zu reduzieren.

### **SPF-Konfiguration in HCL Domino**
Um SPF auf Deinem HCL Domino-Server zu aktivieren:

1. **SPF-Prüfung aktivieren:** 
   - Der Domino-Server kann so konfiguriert werden, dass er die SPF-Informationen für eingehende E-Mails überprüft. Dies erfolgt durch die Konfiguration des Domino SMTP-Servers, um DNS-Lookups für die SPF-Einträge der sendenden Domain durchzuführen.

2. **SPF-Ergebnisse verarbeiten:**
   - Der Domino-Server kann basierend auf den SPF-Ergebnissen verschiedene Aktionen ausführen, z. B. das Markieren von E-Mails als unzuverlässig oder das Verschieben in den Junk-Ordner, wenn die SPF-Prüfung fehlschlägt.

Für detaillierte Anweisungen zur Konfiguration von SPF in HCL Domino kannst Du die [offizielle Dokumentation](https://help.hcl-software.com/domino/12.0.2/admin/wn_configuration_features.html) konsultieren.

### **Zusammenfassung**
Mit den nativen Unterstützungen für sowohl SPF als auch DKIM in HCL Domino ab Version 12 kannst Du Deine E-Mail-Sicherheitsmaßnahmen erheblich verbessern. Diese Protokolle helfen dabei, die Authentizität von E-Mails zu gewährleisten und Dein E-Mail-System vor Missbrauch durch Spoofing und andere Bedrohungen zu schützen.

