**Amavis (amavisd-new)** ist ein leistungsstarker und flexibler Content-Filter, der hauptsächlich dazu verwendet wird, E-Mails auf Spam, Viren, Malware und andere schädliche Inhalte zu überprüfen. Amavis arbeitet als Middleware, die zwischen einem Mail Transfer Agent (MTA) wie Postfix oder Exim und verschiedenen Anti-Spam- und Anti-Viren-Scannern sitzt, um eingehende und ausgehende E-Mails zu analysieren.

### **Funktionen von Amavis**

1. **Virus-Scanning:**
   - Amavis kann mit verschiedenen Antiviren-Scannern wie ClamAV, Kaspersky, Sophos oder anderen verbunden werden, um E-Mails auf schädliche Inhalte zu überprüfen. Es leitet die E-Mails an die Antiviren-Scanner weiter und verarbeitet die Ergebnisse, um infizierte E-Mails zu blockieren oder zu markieren.

2. **Spam-Filterung:**
   - Amavis integriert sich oft mit SpamAssassin, einem weit verbreiteten Spam-Filter, um E-Mails auf Spam-Merkmale zu prüfen. Basierend auf den Bewertungen von SpamAssassin kann Amavis entscheiden, ob eine E-Mail als Spam markiert, in Quarantäne gestellt oder gelöscht wird.

3. **Inhaltsfilterung:**
   - Neben Viren- und Spam-Scans kann Amavis auch andere Inhalte überprüfen, wie z.B. Dateianhänge, um sicherzustellen, dass keine unerwünschten oder gefährlichen Dateien über E-Mails gesendet werden.

4. **Quarantäne-Management:**
   - E-Mails, die als verdächtig eingestuft werden, können in einer Quarantäne-Datenbank gespeichert werden. Administratoren können diese E-Mails manuell überprüfen und entscheiden, ob sie zugestellt oder endgültig gelöscht werden sollen.

5. **Integration mit MTAs:**
   - Amavis kann nahtlos mit verschiedenen MTAs wie Postfix, Exim und Sendmail integriert werden. Es arbeitet als SMTP-Proxy oder als Content-Filter, der die E-Mails vor der endgültigen Zustellung überprüft.

6. **Flexibilität und Anpassbarkeit:**
   - Amavis ist hochgradig konfigurierbar und unterstützt eine Vielzahl von Konfigurationen und Plugins. Dies ermöglicht es Administratoren, die Verarbeitung von E-Mails genau nach den Anforderungen ihrer Organisation anzupassen.

### **Wie funktioniert Amavis?**

1. **E-Mail Empfang:**
   - Wenn eine E-Mail den Mailserver erreicht, wird sie von Amavis verarbeitet. Amavis empfängt die E-Mail vom MTA und leitet sie an die konfigurierten Anti-Spam- und Anti-Viren-Tools weiter.

2. **Inhaltsprüfung:**
   - Amavis analysiert die E-Mail-Inhalte, führt Virenscans durch und überprüft sie auf Spam-Merkmale und andere potenziell schädliche Inhalte.

3. **Entscheidung:**
   - Basierend auf den Ergebnissen der Scans entscheidet Amavis, ob die E-Mail zugestellt, in Quarantäne gestellt, als Spam markiert oder gelöscht wird.

4. **Weiterleitung:**
   - Nach der Prüfung wird die E-Mail an den MTA zurückgegeben, der sie dann an den Empfänger weiterleitet, falls sie als sicher eingestuft wurde.

### **Typische Einsatzszenarien**

- **Mail-Gateways:** Amavis wird häufig in Mail-Gateways eingesetzt, um eingehende und ausgehende E-Mails in Unternehmen zu überprüfen.
- **E-Mail-Server:** Amavis kann auf E-Mail-Servern eingesetzt werden, die hohe Sicherheitsanforderungen haben, um sicherzustellen, dass keine gefährlichen E-Mails an Benutzer zugestellt werden.
- **Kombination mit anderen Sicherheitslösungen:** Oft wird Amavis zusammen mit SpamAssassin und ClamAV verwendet, um eine umfassende E-Mail-Sicherheitslösung zu bieten.

### **Zusammenfassung**

Amavis ist ein vielseitiger und effektiver Content-Filter, der E-Mails auf Viren, Spam und andere schädliche Inhalte prüft. Es wird häufig in Kombination mit MTAs wie Postfix oder Exim verwendet und ist flexibel genug, um mit verschiedenen Antiviren-Scannern und Spam-Filtern zu arbeiten. Amavis spielt eine zentrale Rolle bei der Sicherung der E-Mail-Kommunikation in Netzwerken, indem es dafür sorgt, dass nur sichere und saubere E-Mails an die Benutzer weitergeleitet werden.