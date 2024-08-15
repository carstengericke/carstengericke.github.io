### E-Mail Archivierung

### 1. **Mail Journaling aktivieren**

Mit dem Mail Journaling in Domino kannst Du alle ein- und ausgehenden E-Mails erfassen und in einer speziellen Datenbank speichern. Das ist besonders praktisch für die Archivierung und um rechtliche Anforderungen zu erfüllen.

#### **So aktivierst Du das Mail Journaling:**

1. **Journal-Datenbank einrichten:**
   - Erstelle eine neue Domino-Datenbank auf dem Server, die als Journal-Datenbank dient. In dieser Datenbank werden dann alle kopierten E-Mails gespeichert.
   - Verwende dazu eine der vorhandenen Vorlagen, wie z.B. **MailJrn.ntf**, um die Journal-Datenbank zu erstellen.

2. **Mail Journaling aktivieren:**
   - Öffne den Domino Administrator und gehe zu **Konfiguration**.
   - Navigiere zu **Messaging** -> **Configurations** und wähle die passende Konfigurationsdokumentation für Deinen Server aus.
   - Unter den **Router/SMTP**-Einstellungen findest Du die Option **Mail Journaling**.
   - Aktiviere das Journaling und gib die Adresse der Journal-Datenbank an, die Du vorher erstellt hast.

3. **Journaling-Einstellungen konfigurieren:**
   - Du kannst festlegen, ob das Journaling für alle E-Mails gelten soll oder nur für bestimmte Bedingungen (z.B. alle ein- und ausgehenden E-Mails).
   - Es ist auch möglich, die Journaling-Einstellungen auf bestimmte E-Mail-Domänen, Absender oder Empfänger zu beschränken.

4. **Überwachung und Pflege:**
   - Überwache regelmäßig die Größe der Journal-Datenbank, um sicherzustellen, dass sie nicht zu groß wird. Du kannst Archivierungsrichtlinien für die Journal-Datenbank einrichten, um ältere E-Mails in separate Archive zu verschieben.

### 2. **E-Mails chronologisch in einer Datenbank speichern**

Um die E-Mails in der Journal-Datenbank chronologisch zu speichern und leicht durchsuchbar zu machen, kannst Du folgende Schritte unternehmen:

1. **Ansichten erstellen:**
   - Erstelle in der Journal-Datenbank Ansichten, die E-Mails nach Datum sortieren. Verwende dafür die Sortierung nach dem Feld `DeliveredDate` oder `PostedDate`, um die Nachrichten chronologisch anzuordnen.
   - Du kannst verschiedene Ansichten erstellen, z.B. für ein- und ausgehende E-Mails oder nach bestimmten Zeiträumen (täglich, wöchentlich, monatlich).

2. **Kategorisierung nach Datum:**
   - Um die Navigation zu erleichtern, kannst Du die E-Mails in der Ansicht nach Jahr, Monat und Tag kategorisieren. Das macht es einfacher, E-Mails in einem bestimmten Zeitraum zu finden.

3. **Automatisierung und Skripting:**
   - Wenn nötig, kannst Du Agenten oder Skripte einrichten, die automatisch archivierte E-Mails in der Journal-Datenbank verarbeiten, kategorisieren oder in separate Archivdatenbanken verschieben.

### 3. **Zugriff und Sicherheit**

1. **Zugriffsrechte:**
   - Stelle sicher, dass nur autorisierte Benutzer Zugriff auf die Journal-Datenbank haben. Konfiguriere die Zugriffssteuerungsliste (ACL) entsprechend, um unberechtigte Zugriffe zu verhindern.

2. **Audit-Logging:**
   - Aktiviere Audit-Logging, um alle Zugriffe auf die Journal-Datenbank zu protokollieren. Das ist wichtig für Compliance-Anforderungen und die Überprüfung der Integrität des Archivs.

### **Zusammenfassung**

Mit HCL Domino kannst Du alle ein- und ausgehenden E-Mails erfassen und in einer speziellen Journal-Datenbank speichern, indem Du das Mail Journaling aktivierst. In dieser Datenbank kannst Du die E-Mails chronologisch sortieren und kategorisieren, was die Archivierung und das Auffinden von E-Mails erleichtert. Durch die richtige Konfiguration von Ansichten, Kategorien und Sicherheitsmaßnahmen kannst Du sicherstellen, dass alle relevanten E-Mails archiviert und bei Bedarf zugänglich sind.