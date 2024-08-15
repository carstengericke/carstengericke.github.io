**SPF** (Sender Policy Framework) und **DKIM** (DomainKeys Identified Mail) sind zwei wichtige E-Mail-Authentifizierungsprotokolle, die dazu beitragen, die Echtheit von E-Mails zu überprüfen und das Risiko von E-Mail-Spoofing und Phishing zu reduzieren.

### 1. **SPF (Sender Policy Framework)**

**SPF** ist ein Authentifizierungsprotokoll, das E-Mail-Empfängern hilft zu überprüfen, ob eine eingehende E-Mail von einem autorisierten Server gesendet wurde. Es wird verwendet, um zu verhindern, dass E-Mail-Adressen gefälscht werden (E-Mail-Spoofing).

#### **Wie funktioniert SPF?**
- Der Domaininhaber erstellt einen SPF-Eintrag im DNS (Domain Name System), der eine Liste der autorisierten E-Mail-Server enthält, die E-Mails im Namen dieser Domäne senden dürfen.
- Wenn ein E-Mail-Server eine eingehende E-Mail erhält, prüft er den SPF-Eintrag der Absenderdomäne.
- Der E-Mail-Server vergleicht die IP-Adresse des sendenden Servers mit den autorisierten IP-Adressen im SPF-Eintrag.
- Wenn die IP-Adresse des sendenden Servers im SPF-Eintrag enthalten ist, wird die E-Mail als authentisch angesehen. Ist sie nicht enthalten, kann die E-Mail abgelehnt oder markiert werden.

#### **Beispiel eines SPF-Eintrags:**
```text
v=spf1 ip4:192.0.2.0/24 include:_spf.google.com -all
```
- `v=spf1`: Gibt die Version des SPF-Protokolls an.
- `ip4:192.0.2.0/24`: Gibt an, dass E-Mails von IP-Adressen im Bereich 192.0.2.0 bis 192.0.2.255 gesendet werden dürfen.
- `include:_spf.google.com`: Erlaubt auch die Nutzung der in _spf.google.com definierten Server.
- `-all`: Bedeutet, dass alle anderen Server abgelehnt werden sollen.

### 2. **DKIM (DomainKeys Identified Mail)**

**DKIM** ist ein weiteres Authentifizierungsprotokoll, das eine digitale Signatur zu E-Mails hinzufügt, um die Authentizität des Absenders zu bestätigen und sicherzustellen, dass die E-Mail während der Übertragung nicht verändert wurde.

#### **Wie funktioniert DKIM?**
- Der Domaininhaber erstellt ein Schlüsselpaar (privat und öffentlich). Der private Schlüssel bleibt auf dem E-Mail-Server, während der öffentliche Schlüssel in einem DNS-Eintrag veröffentlicht wird.
- Beim Versenden einer E-Mail signiert der E-Mail-Server bestimmte Kopfzeilen und Teile des Inhalts mit dem privaten Schlüssel.
- Der empfangende E-Mail-Server kann die Signatur mit dem öffentlichen Schlüssel überprüfen, der im DNS-Eintrag der Absenderdomäne veröffentlicht ist.
- Wenn die Signatur validiert wird, kann der Empfänger sicher sein, dass die E-Mail tatsächlich von der angegebenen Domäne stammt und unterwegs nicht manipuliert wurde.

#### **Beispiel eines DKIM-DNS-Eintrags:**
```text
default._domainkey.example.com IN TXT "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQ..."
```
- `v=DKIM1`: Gibt die Version des DKIM-Protokolls an.
- `k=rsa`: Gibt den verwendeten Verschlüsselungsalgorithmus an.
- `p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQ...`: Dies ist der öffentliche Schlüssel, der zur Überprüfung der Signatur verwendet wird.

### **Zusammenspiel von SPF und DKIM**

SPF und DKIM arbeiten oft zusammen, um die Authentizität von E-Mails sicherzustellen. Während SPF sicherstellt, dass die E-Mail von einem autorisierten Server gesendet wurde, stellt DKIM sicher, dass der Inhalt der E-Mail während der Übertragung nicht verändert wurde.

### **Vorteile von SPF und DKIM**

- **Schutz vor Phishing:** Beide Protokolle tragen dazu bei, dass E-Mails nicht gefälscht werden können, was das Risiko von Phishing-Angriffen reduziert.
- **E-Mail-Integrität:** DKIM sorgt dafür, dass E-Mails unterwegs nicht manipuliert werden, was die Integrität der Kommunikation bewahrt.
- **Erhöhung der Zustellbarkeit:** E-Mails, die SPF und DKIM bestehen, werden von vielen E-Mail-Diensten als vertrauenswürdiger angesehen und landen seltener im Spam-Ordner.

### **Zusammenfassung**

SPF und DKIM sind wesentliche Protokolle, um die Sicherheit und Vertrauenswürdigkeit von E-Mail-Kommunikation zu erhöhen. Durch die Implementierung dieser Technologien können Unternehmen und Organisationen das Risiko von E-Mail-Spoofing, Phishing und anderen Bedrohungen erheblich verringern.