**DMARC** hilft Organisationen, die Authentizität ihrer ausgehenden E-Mails zu gewährleisten und das Risiko von E-Mail-Spoofing, Phishing und anderen bösartigen Aktivitäten zu reduzieren.

1. **Definition von DMARC:**
   - **DMARC** ist ein E-Mail-Authentifizierungsprotokoll, das auf den bestehenden Technologien SPF (Sender Policy Framework) und DKIM (DomainKeys Identified Mail) aufbaut. Es ermöglicht E-Mail-Domäneninhabern, Richtlinien festzulegen, die empfangende E-Mail-Server befolgen sollen, um die Authentizität der E-Mails zu überprüfen.

2. **Funktion von DMARC:**
   - **Prüfung von E-Mails:** DMARC legt fest, wie empfangende E-Mail-Server E-Mails behandeln sollen, die angeblich von einer bestimmten Domäne stammen, aber die SPF- oder DKIM-Prüfungen nicht bestehen. Die Institution kann entscheiden, ob diese E-Mails akzeptiert, in den Spam-Ordner verschoben oder abgelehnt werden sollen.
   - **Berichterstattung:** DMARC bietet die Möglichkeit, Berichte über fehlgeschlagene Prüfungen zu erhalten, was Administratoren hilft, mögliche Missbrauchsfälle zu erkennen und ihre E-Mail-Sicherheitsrichtlinien entsprechend anzupassen.

3. **Warum sollte die Institution DMARC nutzen?**
   - **Schutz vor Phishing und Spoofing:** DMARC schützt die Marke der Institution, indem es verhindert, dass Angreifer E-Mails im Namen der Institution versenden können. Dies verringert das Risiko von Phishing-Angriffen und anderen E-Mail-basierten Bedrohungen.
   - **Vertrauenswürdigkeit erhöhen:** Durch die Implementierung von DMARC kann die Institution sicherstellen, dass ihre E-Mails bei den Empfängern ankommen und nicht in Spam-Filtern hängenbleiben. Dies erhöht die Vertrauenswürdigkeit und Zustellbarkeit von E-Mails.

4. **Technische Implementierung:**
   - Die Institution erstellt einen **DMARC-Eintrag** im DNS, der die gewünschten Richtlinien enthält. Dies kann Anweisungen zur Behandlung von E-Mails umfassen, die die SPF- oder DKIM-Prüfungen nicht bestehen.
   - **Beispiel:** Ein typischer DMARC-Eintrag könnte so aussehen:
     ```txt
     v=DMARC1; p=reject; rua=mailto:dmarc-reports@yourdomain.com; ruf=mailto:dmarc-failures@yourdomain.com; pct=100
     ```
     - `p=reject`: Weist empfangende Server an, E-Mails abzulehnen, die die Authentifizierungsprüfungen nicht bestehen.
     - `rua`: Gibt die E-Mail-Adresse an, an die aggregierte Berichte gesendet werden sollen.
     - `ruf`: Gibt die E-Mail-Adresse an, an die Berichte über fehlgeschlagene Nachrichten gesendet werden sollen.
     - `pct=100`: Gibt an, dass die Richtlinie auf 100 % der Nachrichten angewendet werden soll.

### **Zusammenfassung**

Die Nutzung von DMARC hilft, dass die Institution die Authentizität ihrer ausgehenden E-Mails schützt und das Risiko von E-Mail-Spoofing minimiert. DMARC bietet eine klare Richtlinie dafür, wie empfangende E-Mail-Server mit E-Mails umgehen sollen, die möglicherweise gefälscht oder manipuliert wurden. Durch die Implementierung von DMARC stärkt die Institution die Sicherheit ihrer E-Mail-Kommunikation und schützt ihre Marke und Benutzer vor potenziellen Bedrohungen.