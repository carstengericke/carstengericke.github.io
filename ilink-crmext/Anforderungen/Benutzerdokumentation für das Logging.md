### Benutzerdokumentation für das Logging

#### Inhaltsverzeichnis

1. **Einleitung**
2. **Überblick über das Logging-System**
3. **Benutzung der Benutzeroberfläche zur Debug-Aktivierung**
   - 3.1 Zugriff auf die Log-Einstellungen
   - 3.2 Aktivierung des Debug-Modus für einzelne Module
   - 3.3 Deaktivierung des Debug-Modus
4. **Verständnis der Log-Dateien**
   - 4.1 Wo werden die Log-Dateien gespeichert?
   - 4.2 Unterscheidung zwischen Info- und Debug-Logs
5. **INI-Dateien**
   - 5.1 Struktur der INI-Dateien
   - 5.2 Manuelle Anpassung der INI-Dateien (Optional)
6. **Häufige Fragen (FAQ)**

---

### 1. Einleitung

Willkommen zur Benutzerdokumentation für das Logging-System Ihrer Windows Telefonanwendung. Dieses Dokument hilft Ihnen dabei, das Logging-System effizient zu nutzen, um die Aktivitäten der Anwendung zu überwachen und eventuelle Fehler zu diagnostizieren.

### 2. Überblick über das Logging-System

Das Logging-System ist in zwei Hauptmodi unterteilt:
- **Info-Modus:** Dieser Modus protokolliert nur die grundlegenden Aktivitäten der Anwendung.
- **Debug-Modus:** Dieser Modus liefert detaillierte Informationen, die zur Fehlerdiagnose verwendet werden können.

Für jedes Modul der Anwendung kann individuell festgelegt werden, ob es im Debug-Modus arbeiten soll oder nicht. Diese Einstellungen werden in speziellen INI-Dateien gespeichert.

### 3. Benutzung der Benutzeroberfläche zur Debug-Aktivierung

#### 3.1 Zugriff auf die Log-Einstellungen

1. Starten Sie die Anwendung.
2. Öffnen Sie das Menü **Einstellungen**.
3. Wählen Sie den Abschnitt **Log-Einstellungen** aus, um zu den spezifischen Log-Optionen der verschiedenen Module zu gelangen.

#### 3.2 Aktivierung des Debug-Modus für einzelne Module

1. Im **Log-Einstellungen**-Bereich sehen Sie eine Liste der verfügbaren Module, z.B.:
   - Telefonsystem-Verbindung
   - Datenbank 1-Verbindung
   - Rufnummern-Suchalgorithmus
2. Für jedes Modul gibt es eine Checkbox **Debug-Modus aktivieren**.
3. Aktivieren Sie die Checkbox für das Modul, das Sie im Debug-Modus betreiben möchten.
4. Die Einstellung wird automatisch gespeichert und die INI-Datei des betreffenden Moduls wird aktualisiert.

#### 3.3 Deaktivierung des Debug-Modus

1. Um den Debug-Modus für ein Modul wieder zu deaktivieren, entfernen Sie das Häkchen in der entsprechenden Checkbox.
2. Die Änderung wird ebenfalls sofort gespeichert, und das Modul wechselt in den Info-Modus.

### 4. Verständnis der Log-Dateien

#### 4.1 Wo werden die Log-Dateien gespeichert?

Die Log-Dateien werden im folgenden Verzeichnis gespeichert:
- **Standardpfad:** `C:\Programme\Telefonanwendung\Logs\`

Jede Log-Datei ist nach dem Modul und dem Datum benannt, z.B. `Telefonsystem-2024-08-12.log`.

#### 4.2 Unterscheidung zwischen Info- und Debug-Logs

- **Info-Logs:** Enthalten grundlegende Informationen, wie Start- und Endzeit der Anwendung, sowie Verbindungsstatus.
- **Debug-Logs:** Enthalten detaillierte Ablaufprotokolle, Zwischenergebnisse und Fehlerdiagnosen.

### 5. INI-Dateien

#### 5.1 Struktur der INI-Dateien

Jedes Modul hat eine eigene INI-Datei im Konfigurationsverzeichnis:
- **Standardpfad:** `C:\Programme\Telefonanwendung\Config\`

Die INI-Dateien haben folgenden Aufbau:
```
[Logging]
DebugEnabled=True  ; oder False
```

#### 5.2 Manuelle Anpassung der INI-Dateien (Optional)

Falls Sie den Debug-Modus manuell aktivieren oder deaktivieren möchten, können Sie die INI-Dateien mit einem Texteditor bearbeiten:
1. Öffnen Sie die INI-Datei des gewünschten Moduls.
2. Ändern Sie den Wert `DebugEnabled` auf `True` oder `False`.
3. Speichern Sie die Datei und schließen Sie den Editor.

Die Änderungen werden beim nächsten Zugriff des Moduls auf die INI-Datei wirksam.

### 6. Häufige Fragen (FAQ)

**Frage:** Wie kann ich sehen, ob der Debug-Modus aktiviert ist?
- **Antwort:** Sie können dies in der Benutzeroberfläche unter **Log-Einstellungen** überprüfen oder die INI-Datei des Moduls ansehen.

**Frage:** Kann ich mehrere Module gleichzeitig im Debug-Modus laufen lassen?
- **Antwort:** Ja, Sie können den Debug-Modus für mehrere Module gleichzeitig aktivieren.

**Frage:** Werden meine Log-Einstellungen nach einem Neustart der Anwendung beibehalten?
- **Antwort:** Ja, die Einstellungen werden in den INI-Dateien gespeichert und bleiben erhalten, auch wenn die Anwendung neu gestartet wird.

