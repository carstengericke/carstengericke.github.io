
### Anleitung zum Import der Datev Kontakt-Daten in die Contacts App der innovaphone

#### **Schritt 1: Exportieren der Kontaktdaten aus DATEV**

**Kommando:**

```
java -jar ilinkCRMExtCLI.jar -c pull -f src.yaml
```

**Beschreibung:**

Dieses Kommando verwendet die `src.yaml`-Datei, um Kontaktdaten aus der DATEV-Anwendung zu exportieren. Die Datei `src.yaml` sieht so aus:

**`src.yaml`-Datei:**

```
type: "datev"
```

**Erklärung:**

- **type:** Gibt den Typ der Datenquelle an, hier "datev".

#### **Schritt 2: Umformatieren der exportierten Daten**

**Kommando:**

```
java -jar ilinkCRMExtCLI.jar -c convert -f convert.yaml
```

**Beschreibung:**

Dieses Kommando verwendet die `convert.yaml`-Datei, um die exportierten Daten in das benötigte Format für die innovaphone Telefonanlage umzuwandeln. Die Datei `convert.yaml` sieht so aus:

**`convert.yaml`-Datei:**

```
type: "datev"
# output file name
filepath: "contacts-datev.utf8"
separateRecords: true
```

**Erklärung:**

- **type:** Gibt den Typ der Quelldaten an, hier "datev".
- **filepath:** Der Name der Ausgabedatei, in die die konvertierten Daten geschrieben werden. In diesem Fall "contacts-datev.utf8".
- **separateRecords:** Bestimmt, wie die Telefonnummern behandelt werden.
  - `true`: Telefonnummern werden in separaten Zeilen aufgeführt, was dazu führt, dass ein Kontakt mehrfach angezeigt wird, wenn er mehrere Telefonnummern hat.
  - `false` (Standardwert): Nur die erste Telefonnummer eines Kontakts wird berücksichtigt, weitere Telefonnummern werden nicht importiert.

#### **Schritt 3: Importieren der umformatierten Daten in die innovaphone Telefonanlage**

**Kommando:**

```
java -jar ilinkCRMExtCLI.jar -c push -f dest.yaml
```

**Beschreibung:**

Dieses Kommando verwendet die `dest.yaml`-Datei, um die konvertierten Daten in die Contacts App der innovaphone Telefonanlage hochzuladen. Die Datei `dest.yaml` sieht so aus:

**`dest.yaml`-Datei:**

```
type: "innovaphone"
serverUrl: "https://innoapp.ilink.de"
domain: "Applikationen.com"
username: "contacts"
password: "secret"
# file to upload into the innovaphone
filepath: "contacts-datev.utf8"
```

**Erklärung:**

- **type:** Gibt den Typ der Zielanwendung an, hier "innovaphone".
- **serverUrl:** Die URL des innovaphone myApps Servers, zu dem die Daten hochgeladen werden sollen.
- **domain:** Die Domäne, die für die Anmeldung verwendet wird.
- **username:** Der Benutzername für den Zugang zur innovaphone Telefonanlage.
- **password:** Das Passwort für den Zugang zur innovaphone Telefonanlage.
- **filepath:** Der Pfad zur Datei, die hochgeladen werden soll.

### Zusammenfassung der Schritte

1. **Exportieren der Kontaktdaten:**
   ```
   java -jar ilinkCRMExtCLI.jar -c pull -f src.yaml
   ```

2. **Umformatieren der Daten:**
   ```
   java -jar ilinkCRMExtCLI.jar -c convert -f convert.yaml
   ```

3. **Importieren der Daten:**
   ```
   java -jar ilinkCRMExtCLI.jar -c push -f dest.yaml
   ```

Diese Anleitung und die Konfigurationsdateien stellen sicher, dass die Kontaktdaten aus der DATEV-Anwendung korrekt exportiert, umformatiert und in die innovaphone Telefonanlage importiert werden. Achten Sie darauf, den `separateRecords`-Parameter in `convert.yaml` gemäß Ihrer Anforderungen zu setzen, um das gewünschte Verhalten bezüglich der Telefonnummern zu erzielen.

### Automatisierung des Datenexports, der Umformatierung und des Imports

Diese Anleitung beschreibt, wie du die drei Kommandos zur Verarbeitung der Kontaktdaten in ein Batch-Skript (`run.bat`) einfügen und dieses Skript dann mithilfe des Windows Aufgabenplaners automatisiert ausführen kannst.

#### **Schritt 1: Erstellen der Konfigurationsdateien**

1. **`src.yaml`** (Konfigurationsdatei für den Export aus DATEV)

   ```
   type: "datev"
   ```

2. **`convert.yaml`** (Konfigurationsdatei für die Umformatierung der exportierten Daten)

   ```
   type: "datev"
   # output file name
   filepath: "contacts-datev.utf8"
   separateRecords: true
   ```

3. **`dest.yaml`** (Konfigurationsdatei für den Import in die innovaphone Telefonanlage)

   ```
   type: "innovaphone"
   serverUrl: "https://innoapp.ilink.de"
   domain: "Applikationen.com"
   username: "contacts"
   password: "secret"
   # file to upload into the innovaphone
   filepath: "contacts-datev.utf8"
   ```

#### **Schritt 2: Erstellen des Batch-Skripts `run.bat`**

Erstelle eine Batch-Datei namens `run.bat` und füge den folgenden Inhalt ein:

```
cd C:\ilink\kis
mkdir log
java -jar ilinkCRMExtCLI.jar -c pull -f src.yaml
java -jar ilinkCRMExtCLI.jar -c convert -f convert.yaml
java -jar ilinkCRMExtCLI.jar -c push -f dest.yaml
```

#### **Schritt 3: Automatisieren mit dem Windows Aufgabenplaner**

1. **Öffnen des Aufgabenplaners:**
   - Drücke `Win + R`, gib `taskschd.msc` ein und drücke `Enter`.

2. **Erstellen einer neuen Aufgabe:**
   - Klicke auf "Aufgabe erstellen" im rechten Bereich.

3. **Allgemein:**
   - Gib der Aufgabe einen Namen, z.B. "DATEV zu innovaphone Import".
   - Wähle "Unabhängig von der Benutzeranmeldung ausführen" und "Mit höchsten Privilegien ausführen".

4. **Trigger:**
   - Klicke auf "Neu...".
   - Stelle die Aufgabe so ein, dass sie täglich zu einer bestimmten Uhrzeit ausgeführt wird (z.B. um 02:00 Uhr nachts).

5. **Aktionen:**
   - Klicke auf "Neu...".
   - Aktion: "Programm starten".
   - Programm/Skript: Gib den Pfad zu deiner `run.bat` Datei an, z.B. `C:\ilink\ilinkCRMExtCLI\run.bat`.

6. **Bedingungen:**
   - Deaktiviere alle Kontrollkästchen, außer das für "Aufgabe nur starten, wenn der Computer im Leerlauf ist".

7. **Einstellungen:**
   - Aktiviere "Erneut starten, falls der Vorgang fehlschlägt".
   - Stelle die Wiederholungsversuche auf "3".

#### **Zusammenfassung der Schritte**

1. **Exportieren der Kontaktdaten aus DATEV:**
   ```
   java -jar ilinkCRMExtCLI.jar -c pull -f src.yaml
   ```

2. **Umformatieren der Daten:**
   ```
   java -jar ilinkCRMExtCLI.jar -c convert -f convert.yaml
   ```

3. **Importieren der Daten in die innovaphone Telefonanlage:**
   ```
   java -jar ilinkCRMExtCLI.jar -c push -f dest.yaml
   ```

Mit diesen Schritten kannst du sicherstellen, dass die Kontaktdaten korrekt von DATEV exportiert, umformatiert und in die innovaphone Telefonanlage importiert werden, und dies alles automatisch einmal pro Nacht ausgeführt wird.