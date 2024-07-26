### Was ist Sender Policy Framework (SPF)?

Sender Policy Framework (SPF) ist ein Authentifizierungsprotokoll, das hilft, E-Mail-Spoofing zu verhindern. Es ermöglicht den Besitzern von E-Mail-Domänen, festzulegen, welche IP-Adressen berechtigt sind, E-Mails im Namen ihrer Domäne zu senden. Dies geschieht durch die Veröffentlichung eines speziellen DNS-Eintrags (TXT-Eintrag) für die Domäne, der die autorisierten IP-Adressen enthält.

Wenn ein E-Mail-Server eine eingehende E-Mail erhält, überprüft er den SPF-Eintrag der Absenderdomäne, um zu sehen, ob die E-Mail von einer autorisierten IP-Adresse stammt. Falls die IP-Adresse nicht im SPF-Eintrag enthalten ist, kann der E-Mail-Server die E-Mail ablehnen oder als Spam markieren.

Die grundlegenden Schritte zur Konfiguration von SPF sind:
1. Erstellen eines SPF-Eintrags für die DNS-Zone Deiner Domäne.
2. Veröffentlichung des SPF-Eintrags als TXT-Eintrag im DNS.

### Unterstützt HCL Domino SPF?

HCL Domino unterstützt das Sender Policy Framework (SPF). Du kannst Deinen Domino-Server so konfigurieren, dass er SPF-Prüfungen für eingehende E-Mails durchführt. Hierbei ist es wichtig, sicherzustellen, dass der Domino-Server richtig eingerichtet ist, um SPF-Prüfungen durchzuführen und die Ergebnisse dieser Prüfungen zu berücksichtigen.

Die Konfiguration umfasst in der Regel folgende Schritte:
1. **Aktivieren der SPF-Prüfung**: Dies kann in den Serverdokumenten oder Konfigurationsdokumenten geschehen, je nach Version und spezifischer Einrichtung Deines Domino-Servers.
2. **Konfiguration der SPF-Prüfung**: Dabei legst Du fest, wie der Server auf SPF-Fehler reagieren soll (z.B. Ablehnung der E-Mail, Markierung als Spam usw.).
3. **Updates und Patches**: Stelle sicher, dass Dein Domino-Server auf dem neuesten Stand ist, da ältere Versionen möglicherweise nicht die neuesten Sicherheitsfunktionen und -konfigurationen unterstützen.

# Detaillierte Anweisungen zur Konfiguration der SPF-Unterstützung auf einem HCL Domino-Server
TODO