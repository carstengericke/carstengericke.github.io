### Benutzerdokumentation für das Logging-System der **ilink CRM Extensions**

#### Inhaltsverzeichnis

1. **Einleitung**
2. **Überblick über das Logging-System**
3. **Benutzung der Benutzeroberfläche zur Debug-Aktivierung**
   - 3.1 Zugriff auf die Log-Einstellungen
   - 3.2 Aktivierung des Debug-Modus für einzelne Module
   - 3.3 Deaktivierung des Debug-Modus
4. **Verständnis der Log-Dateien**
   - 4.1 Speicherort der Log-Dateien
   - 4.2 Unterscheidung zwischen Info- und Debug-Logs
5. **INI-Dateien**
   - 5.1 Speicherort und Struktur der INI-Dateien
   - 5.2 Manuelle Anpassung der INI-Dateien (Optional)
6. **Häufige Fragen (FAQ)**

---

### 1. Einleitung

Willkommen zur Benutzerdokumentation für das Logging-System der **ilink CRM Extensions**. Diese Anleitung hilft dir dabei, das Logging-System zu verstehen und es optimal zu nutzen, um die Aktivitäten der Anwendung zu überwachen und eventuelle Probleme zu diagnostizieren.

### 2. Überblick über das Logging-System

Das Logging-System der **ilink CRM Extensions** bietet zwei Hauptmodi:

- **Info-Modus:** Dieser Modus protokolliert nur grundlegende Informationen wie den Start und das Ende der Anwendung sowie die Verbindungsstatus.
- **Debug-Modus:** Dieser Modus bietet detaillierte Informationen, die bei der Diagnose von Problemen hilfreich sind.

Für jedes Modul der Anwendung kannst du individuell festlegen, ob es im Debug-Modus arbeiten soll oder nicht. Diese Einstellungen werden in spezifischen INI-Dateien gespeichert.

### 3. Benutzung der Benutzeroberfläche zur Debug-Aktivierung

#### 3.1 Zugriff auf die Log-Einstellungen

1. Starte die **ilink CRM Extensions**.
2. Gehe ins **Einstellungen**-Menü.
3. Wähle den Abschnitt **Log-Einstellungen** aus, um die Log-Optionen der verschiedenen Module zu sehen.

#### 3.2 Aktivierung des Debug-Modus für einzelne Module

1. Im **Log-Einstellungen**-Bereich siehst du eine Liste der verfügbaren Module, z.B.:
   - Telefonsystem-Verbindung
   - Datenbank-Verbindungen
   - Rufnummern-Suchalgorithmus
2. Für jedes Modul gibt es eine Checkbox **Debug-Modus aktivieren**.
3. Aktiviere die Checkbox für das Modul, für das du den Debug-Modus aktivieren möchtest.
4. Die Änderung wird automatisch in der entsprechenden INI-Datei gespeichert.

#### 3.3 Deaktivierung des Debug-Modus

1. Um den Debug-Modus wieder zu deaktivieren, entferne das Häkchen in der Checkbox des entsprechenden Moduls.
2. Die Änderung wird ebenfalls sofort in der INI-Datei gespeichert, und das Modul wechselt in den Info-Modus.

### 4. Verständnis der Log-Dateien

#### 4.1 Speicherort der Log-Dateien

Die Log-Dateien der **ilink CRM Extensions** werden im folgenden Verzeichnis gespeichert:
- **Speicherort:** `%AppData%\Roaming\ilink\CRM Extensions\LOG`

Jede Log-Datei ist nach dem Modul und dem Datum benannt, z.B. `ilinkCRMExt-2024-08-12.log`.

#### 4.2 Unterscheidung zwischen Info- und Debug-Logs

- **Info-Logs:** Diese enthalten grundlegende Informationen wie den Start- und Endzeitpunkt der Anwendung sowie die Verbindungsstatus.
- **Debug-Logs:** Diese Logs enthalten detaillierte Informationen, einschließlich Protokollen von Zwischenschritten und Fehlerdiagnosen.

### 5. INI-Dateien

#### 5.1 Speicherort und Struktur der INI-Dateien

Jedes Modul hat eine eigene INI-Datei, in der gespeichert wird, ob der Debug-Modus aktiviert ist. Diese INI-Dateien befinden sich im folgenden Verzeichnis:
- **Speicherort:** `%AppData%\Roaming\ilink\CRM Extensions\CFG`

Die Struktur einer typischen INI-Datei sieht folgendermaßen aus:
```
[Logging]
DebugEnabled=True  ; oder False
```

#### 5.2 Manuelle Anpassung der INI-Dateien (Optional)

Falls du den Debug-Modus manuell aktivieren oder deaktivieren möchtest, kannst du die INI-Dateien mit einem Texteditor bearbeiten:
1. Navigiere zu `%AppData%\Roaming\ilink\CRM Extensions\CFG`.
2. Öffne die INI-Datei des gewünschten Moduls.
3. Ändere den Wert `DebugEnabled` auf `True` oder `False`.
4. Speichere die Datei und schließe den Editor.

Die Änderungen werden beim nächsten Zugriff des Moduls auf die INI-Datei wirksam.

### 6. Häufige Fragen (FAQ)

**Frage:** Wie kann ich sehen, ob der Debug-Modus aktiviert ist?
- **Antwort:** Du kannst dies in der Benutzeroberfläche unter **Log-Einstellungen** überprüfen oder die INI-Datei des Moduls ansehen.

**Frage:** Kann ich mehrere Module gleichzeitig im Debug-Modus betreiben?
- **Antwort:** Ja, du kannst den Debug-Modus für mehrere Module gleichzeitig aktivieren.

**Frage:** Werden meine Log-Einstellungen nach einem Neustart der Anwendung beibehalten?
- **Antwort:** Ja, die Einstellungen werden in den INI-Dateien gespeichert und bleiben auch nach einem Neustart der Anwendung erhalten.

---

Diese Dokumentation sollte dir helfen, das Logging-System der **ilink CRM Extensions** effektiv zu nutzen und bei Bedarf detaillierte Logs zu erzeugen, um Fehler schnell und präzise zu diagnostizieren.