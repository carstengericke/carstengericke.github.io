### LTPA-Schlüssel

In einem Setup, bei dem HCL Sametime und HCL Domino für SSO konfiguriert werden sollen, können die LTPA-Schlüssel während der Installation von Sametime erstellt und anschließend in Domino importiert werden. Hier ist eine Schritt-für-Schritt-Anleitung, wie du das machst:

### Schritt 1: Erstellung der LTPA-Schlüssel in Sametime 12.0.2

1. **WebSphere Liberty Container starten**:
   - Während der Installation von HCL Sametime 12.0.2 wird ein WebSphere Liberty Container einmalig gestartet, um die LTPA-Schlüssel zu erstellen.

2. **LTPA-Schlüssel erstellen**:
   - Die LTPA-Schlüssel werden automatisch im Container erstellt und in einer Datei namens `ltpa.keys` gespeichert.

3. **LTPA-Schlüsseldatei sichern**:
   - Stelle sicher, dass du die `ltpa.keys`-Datei an einem sicheren Ort speicherst. Diese Datei wird sowohl für HCL Sametime als auch für HCL Domino benötigt.

### Schritt 2: Import der LTPA-Schlüssel in Domino

1. **Domino Administrator-Konsole öffnen**:
   - Melde dich an der Domino Administrator-Konsole an.

2. **Web SSO-Konfigurationsdokument erstellen**:
   - Gehe zu `Konfiguration > Web > Web SSO Configuration > Create Web SSO Configuration`.

3. **LTPA-Schlüssel importieren**:
   - Wähle `Import LTPA keys` und lade die `ltpa.keys`-Datei hoch, die du aus dem WebSphere Liberty Container erhalten hast.
   - Gib den gleichen LTPA-Geheimschlüssel ein, der bei der Erstellung der LTPA-Schlüssel verwendet wurde.

4. **Konfiguration des Web-SSO-Dokuments in Domino**:
   - Stelle sicher, dass alle relevanten Server (HCL Verse und HCL Sametime) im Feld `Domino Server Names` aufgeführt sind.
   - Speichere und schließe das Dokument.

### Schritt 3: Konfiguration in Sametime

1. **LTPA-Schlüsseldatei importieren**:
   - Importiere die `ltpa.keys`-Datei auch in deine Sametime-Server, falls dies erforderlich ist.

### Schritt 4: Synchronisierung und Überprüfung

1. **SSL/TLS-Konfiguration**:
   - Konfiguriere SSL/TLS auf beiden Servern, um sicherzustellen, dass die Kommunikation verschlüsselt ist.
   - Stelle sicher, dass beide Server gültige SSL-Zertifikate verwenden.

2. **Überprüfung der SSO-Funktionalität**:
   - Melde dich bei HCL Verse an und überprüfe, ob du nahtlos auf HCL Sametime zugreifen kannst, ohne dich erneut anmelden zu müssen.

Durch diese Schritte stellst du sicher, dass SSO zwischen HCL Verse und HCL Sametime reibungslos funktioniert. Für detaillierte Anweisungen kannst du die [offizielle Dokumentation von HCL Sametime 12.0.2](https://opensource.hcltechsw.com/sametime-doc/v1202/admin/ltpa_generate_key.html) zur Erstellung und Verwaltung der LTPA-Schlüssel konsultieren.