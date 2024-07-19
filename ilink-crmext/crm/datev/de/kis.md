
### Anleitung zum Import der Datev Kontakt-Daten in die Contacts App der innovaphone

#### **Schritt 1: Exportieren der Kontaktdaten aus DATEV**

**Kommando:**

```sh
java -jar ilinkCRMExtCLI.jar -c pull -f src.yaml
```

**Beschreibung:**

Dieses Kommando verwendet die `src.yaml`-Datei, um Kontaktdaten aus der DATEV-Anwendung zu exportieren. Die Datei `src.yaml` sieht so aus:

**`src.yaml`-Datei:**

```yaml
type: "datev"
```

**Erklärung:**

- **type:** Gibt den Typ der Datenquelle an, hier "datev".

#### **Schritt 2: Umformatieren der exportierten Daten**

**Kommando:**

```sh
java -jar ilinkCRMExtCLI.jar -c convert -f convert.yaml
```

**Beschreibung:**

Dieses Kommando verwendet die `convert.yaml`-Datei, um die exportierten Daten in das benötigte Format für die innovaphone Telefonanlage umzuwandeln. Die Datei `convert.yaml` sieht so aus:

**`convert.yaml`-Datei:**

```yaml
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

```sh
java -jar ilinkCRMExtCLI.jar -c push -f dest.yaml
```

**Beschreibung:**

Dieses Kommando verwendet die `dest.yaml`-Datei, um die konvertierten Daten in die Contacts App der innovaphone Telefonanlage hochzuladen. Die Datei `dest.yaml` sieht so aus:

**`dest.yaml`-Datei:**

```yaml
type: "innovaphone"
serverUrl: "http://innoapp.ilink.de"
domain: "Applikationen.com"
username: "contacts"
password: "ilink"
# file to upload into the innovaphone
filepath: "contacts-datev.utf8"
```

**Erklärung:**

- **type:** Gibt den Typ der Zielanwendung an, hier "innovaphone".
- **serverUrl:** Die URL des Servers, zu dem die Daten hochgeladen werden sollen.
- **domain:** Die Domäne, die für die Anmeldung verwendet wird.
- **username:** Der Benutzername für den Zugang zur innovaphone Telefonanlage.
- **password:** Das Passwort für den Zugang zur innovaphone Telefonanlage.
- **filepath:** Der Pfad zur Datei, die hochgeladen werden soll.

### Zusammenfassung der Schritte

1. **Exportieren der Kontaktdaten:**
   ```sh
   java -jar ilinkCRMExtCLI.jar -c pull -f src.yaml
   ```

2. **Umformatieren der Daten:**
   ```sh
   java -jar ilinkCRMExtCLI.jar -c convert -f convert.yaml
   ```

3. **Importieren der Daten:**
   ```sh
   java -jar ilinkCRMExtCLI.jar -c push -f dest.yaml
   ```

Diese Anleitung und die Konfigurationsdateien stellen sicher, dass die Kontaktdaten aus der DATEV-Anwendung korrekt exportiert, umformatiert und in die innovaphone Telefonanlage importiert werden. Achten Sie darauf, den `separateRecords`-Parameter in `convert.yaml` gemäß Ihrer Anforderungen zu setzen, um das gewünschte Verhalten bezüglich der Telefonnummern zu erzielen.