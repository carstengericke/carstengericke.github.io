
### Kontrolle von Mail-Anhängen und Datei-Uploads

### Anleitung: E-Mails mit bestimmten Dateitypen in HCL Domino zurückweisen

Diese Anleitung zeigt dir, wie du in HCL Domino E-Mails zurückweist, wenn Anhänge bestimmte Dateitypen wie `.exe`, `.bat`, oder `.vbs` enthalten. Dies erfolgt durch das Erstellen von E-Mail-Regeln im Domino Administrator.

### Schritt 1: HCL Domino Administrator öffnen
1. Melde dich bei deinem HCL Domino Administrator-Client an.
2. Wähle den Server aus, auf dem du die Regeln einrichten möchtest.

### Schritt 2: Zu Messaging und Configuration navigieren
1. Gehe in der linken Navigationsleiste zu **Messaging**.
2. Klicke auf **Configurations**.
3. Wähle den entsprechenden Server aus, auf dem die Regel angewendet werden soll.

### Schritt 3: Router/SMTP-Konfiguration öffnen
1. Öffne den ausgewählten Server und gehe zum Reiter **Router/SMTP**.
2. Wähle unter **Router/SMTP** den Reiter **Restrictions and Controls**.

### Schritt 4: Zu den Email-Regeln navigieren
1. Im Bereich **Restrictions and Controls** klicke auf den Reiter **Rules**.

### Schritt 5: Neue Regel erstellen
1. Klicke auf **New Rule** (Neue Regel), um eine neue Regel zu erstellen. Es öffnet sich sofort ein Dialog zur Erstellung der Regel.

### Schritt 6: Regelbedingungen festlegen
1. Wähle im Pulldown-Menü die Bedingung **any attachment name** (beliebiger Anhangsname) aus.
2. Stelle sicher, dass die Bedingung auf **contains** (enthält) gesetzt ist.
3. Gib den Dateityp ohne Wildcards oder reguläre Ausdrücke ein, den du blockieren möchtest, z.B. `.exe`.
4. Klicke auf **Add Condition** (Bedingung hinzufügen), um weitere Dateitypen wie `.bat` oder `.vbs` hinzuzufügen. Für jeden Dateityp musst du eine separate Bedingung hinzufügen.

### Schritt 7: Aktion für die Regel definieren
1. Wähle im nächsten Dialogfeld die Aktion **don't accept message** (Nachricht nicht annehmen) aus.

### Schritt 8: Regel speichern und aktivieren
1. Überprüfe, ob die Bedingung und Aktion korrekt konfiguriert sind.
2. Klicke auf **Save & Close** (Speichern & Schließen), um die Regel zu speichern.
3. Stelle sicher, dass die Regel aktiviert ist. Dies wird normalerweise durch ein Häkchen in der Liste der Regeln angezeigt.

### Schritt 9: Testen der Regel
1. Sende eine Test-E-Mail mit einem der blockierten Dateitypen als Anhang an deinen Server.
2. Überprüfe, ob die Nachricht wie gewünscht zurückgewiesen wird.

### Wichtiger Hinweis
- Es ist ratsam, die Regel vor der Implementierung in der Produktionsumgebung ausführlich zu testen.

Bei der Auslieferung von **HCL Domino** sind standardmäßig bestimmte Dateitypen für den Versand und Empfang über das Domino E-Mail-System erlaubt oder blockiert. Die genauen Dateitypen können je nach Konfiguration und Version des Domino-Servers variieren, aber hier sind die allgemeinen Standards:

### Erlaubte Dateitypen
Bei der Standardauslieferung von Domino gibt es normalerweise keine restriktive Liste von ausschließlich erlaubten Dateitypen. Das System ist darauf ausgelegt, die meisten Dateitypen zu verarbeiten, es sei denn, es wurde eine spezifische Sicherheitskonfiguration vorgenommen, die bestimmte Dateitypen blockiert.

### Geblockte Dateitypen (Standardmäßig nicht erlaubt)
Für Sicherheitszwecke blockieren viele Unternehmen oder Administratoren von HCL Domino spezifische Dateitypen, insbesondere solche, die ausführbare Dateien enthalten könnten. Standardmäßig könnten folgende Dateitypen blockiert oder als unsicher markiert werden:

- **.exe** (ausführbare Windows-Dateien)
- **.bat** (Batch-Dateien)
- **.cmd** (Windows-Befehlsskripte)
- **.com** (ausführbare Befehlsdateien)
- **.vbs** (Visual Basic-Skriptdateien)
- **.js** (JavaScript-Dateien)
- **.msi** (Windows Installer-Pakete)
- **.scr** (Bildschirmschonerdateien, die ausführbar sind)
- **.pif** (Program Information Files, die Verknüpfungen für MS-DOS-Programme enthalten)

---

### Anpassung der erlaubten Dateitypen
Administratoren können über die Domino Server-Konsole oder das Domino Administrator-Tool spezifische Regeln zur Blockierung oder Erlaubnis bestimmter Dateitypen einrichten. Diese Konfiguration erfolgt oft in den E-Mail- und Anhangs-Einstellungen, um das Risiko durch unsichere Anhänge zu minimieren.

Es ist wichtig, dass jedes Unternehmen die Liste der erlaubten und geblockten Dateitypen gemäß den eigenen Sicherheitsrichtlinien anpasst, um Bedrohungen durch potenziell schädliche Dateitypen zu reduzieren.

Hier ist eine Anleitung, wie du die maximale E-Mail-Größe in HCL Domino einstellen kannst:

### Anleitung: Maximale E-Mail-Größe in HCL Domino einstellen

Diese Anleitung zeigt dir, wie du die maximale Größe von E-Mails in HCL Domino festlegst. Dies kann helfen, die Serverressourcen zu schonen und das Versenden großer Dateien per E-Mail zu verhindern.

### Schritt 1: HCL Domino Administrator öffnen
1. Melde dich bei deinem HCL Domino Administrator-Client an.
2. Wähle den Server aus, auf dem du die Einstellung vornehmen möchtest.

### Schritt 2: Zu Messaging und Configuration navigieren
1. Gehe in der linken Navigationsleiste zu **Messaging**.
2. Klicke auf **Configurations**.
3. Wähle den entsprechenden Server aus, auf dem die Einstellung angewendet werden soll.

### Schritt 3: Router/SMTP-Konfiguration öffnen
1. Öffne den ausgewählten Server und gehe zum Reiter **Router/SMTP**.
2. Wähle unter **Router/SMTP** den Reiter **Restrictions and Controls**.

### Schritt 4: Maximale E-Mail-Größe festlegen
1. Gehe im Bereich **Restrictions and Controls** zum Reiter **Restrictions**.
2. Suche nach dem Feld **Maximum message size** (Maximale Nachrichtengröße).
3. Trage in das Feld die gewünschte maximale Nachrichtengröße ein. Der Wert wird in Kilobytes (KB) angegeben.

   #### Empfohlener Wert:
   - Ein gängiger und empfohlener Wert für die maximale E-Mail-Größe ist **10,240 KB** (das entspricht 10 MB). Dies verhindert, dass Benutzer sehr große Dateien per E-Mail versenden, was die Leistung des Mailservers beeinträchtigen könnte.

4. Klicke auf **Save & Close** (Speichern & Schließen), um die Änderungen zu speichern.

### Schritt 5: Einstellungen testen
1. Sende eine Test-E-Mail, die die festgelegte maximale Größe überschreitet, um sicherzustellen, dass die Begrenzung ordnungsgemäß funktioniert.
2. Überprüfe, ob die E-Mail abgelehnt oder zurückgewiesen wird, wenn sie die maximale Größe überschreitet.

### Wichtiger Hinweis
- Die festgelegte maximale E-Mail-Größe bezieht sich auf die gesamte Nachricht einschließlich Anhänge.
- Es ist wichtig, einen Wert zu wählen, der die Bedürfnisse deines Unternehmens berücksichtigt, um die Effizienz des Mailservers aufrechtzuerhalten.

---

### Anleitung: Maximale Upload-Größe über die Serverkonfiguration festlegen

Mit der Serverkonfiguration in HCL Domino kannst du festlegen, wie viele Bytes maximal auf den Webserver hochgeladen werden dürfen. Diese Einstellung wird zentral über den Domino Administrator vorgenommen und gilt für den ausgewählten Server.

#### 1. **Domino Administrator öffnen**

- Starte den Domino Administrator und stelle eine Verbindung zu deinem Domino-Server her.

#### 2. **Server-Konfigurationsdokument aufrufen**

- Navigiere zu `Konfiguration` > `Server` > `Konfigurationsdokumente`.
- Wähle den Server aus, für den du die Upload-Größe festlegen möchtest.
- Öffne das zugehörige Konfigurationsdokument, indem du es doppelt anklickst.

#### 3. **HTTP-Protokolleinstellungen anpassen**

- Im geöffneten Konfigurationsdokument wechsle zum Tab `Internetprotokolle` und wähle `HTTP`.
- Suche nach dem Feld `Maximum size of request content`.
- Trage hier die gewünschte maximale Größe in Kilobytes ein.

  - Hinweis: Für die maximale Upload-Größe sind 10000 Kilobytes (10000 KB) voreingestellt.

#### 4. **Änderungen speichern**

- Speichere die vorgenommenen Änderungen im Konfigurationsdokument.
- Schließe das Dokument nach dem Speichern.

#### 5. **HTTP-Task neu starten**

- Damit die Änderungen wirksam werden, musst du den HTTP-Task auf dem Domino-Server neu starten. Dies kannst du über die Domino-Konsole tun:

  ```shell
  tell http restart
  ```

- Alternativ kannst du den gesamten Domino-Server neu starten, um sicherzustellen, dass alle Änderungen korrekt übernommen wurden.

#### 6. **Überprüfung**

- Nachdem der HTTP-Task neu gestartet wurde, versuche eine Datei hochzuladen, die die festgelegte Grenze überschreitet. Dadurch kannst du überprüfen, ob die Einstellung korrekt angewendet wurde.

### Zusammenfassung:

- **Schritt 1:** Öffne den Domino Administrator.
- **Schritt 2:** Navigiere zum Konfigurationsdokument des Servers.
- **Schritt 3:** Passe die maximale Größe eines HTTP-PUT/POST in den HTTP-Protokolleinstellungen an.
- **Schritt 4:** Speichere die Änderungen.
- **Schritt 5:** Starte den HTTP-Task oder den gesamten Server neu.
- **Schritt 6:** Überprüfe die Einstellung durch einen Upload-Test.

