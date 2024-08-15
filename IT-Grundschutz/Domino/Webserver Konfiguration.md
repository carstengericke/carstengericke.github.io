### Klassischen Webserver in HCL Domino deaktivieren und HTTPS erzwingen

### 1. Vorbereitung
- Stellen Sie sicher, dass Sie über Administratorrechte für den Domino-Server verfügen.
- Sichern Sie die Konfigurationsdateien und Datenbanken, bevor Sie Änderungen vornehmen.

### 2. Zugriff auf die Serverkonfiguration
- Starten Sie den Domino Administrator.
- Verbinden Sie sich mit dem Domino-Server, auf dem der klassische Webserver deaktiviert werden soll.

### 3. Ändern der Serverdokument-Einstellungen
- Gehen Sie im Domino Administrator zu **Konfiguration** -> **Server** -> **Alle Serverdokumente**.
- Wählen Sie den Server aus, auf dem Sie den Webserver deaktivieren möchten, und öffnen Sie das Serverdokument.

### 4. Webserver-Einstellungen anpassen
- Wechseln Sie im Serverdokument zum Reiter **Internetprotokolle**.
- Wählen Sie dann **HTTP** aus.
- In den HTTP-Einstellungen sehen Sie verschiedene Optionen, darunter die folgenden, die für den klassischen Webserver relevant sind:
  - **HTTP-Dienste starten**: Setzen Sie diese Option auf "Nein", um den klassischen HTTP-Server vollständig zu deaktivieren.
  
  Falls Sie nur bestimmte Funktionen deaktivieren möchten, können Sie auch die folgenden Schritte durchführen:
  - **Verzeichnissuche aktivieren**: Deaktivieren Sie diese Option, wenn der Webserver keine statischen Verzeichnisse durchsuchen soll.
  - **Standard-Websites**: Löschen oder deaktivieren Sie alle Einträge, die statische Websites definieren.

### 5. Änderungen speichern und den Server neu starten
- Speichern Sie die Änderungen, indem Sie auf **Speichern und schließen** klicken.
- Starten Sie den Domino-Server neu, damit die Änderungen wirksam werden. Dies können Sie entweder über den Domino Administrator tun oder durch einen Neustart des Servers selbst.

### 6. Überprüfung
- Überprüfen Sie nach dem Neustart des Servers, ob der klassische Webserver deaktiviert ist:
  - Versuchen Sie, auf eine zuvor verfügbare statische Seite oder ein Verzeichnis zuzugreifen.
  - Stellen Sie sicher, dass nur die Anwendungen, die Sie aktiv halten möchten (z. B. HCL Verse), erreichbar sind.

### 7. HTTP auf HTTPS umleiten

#### 7.1 SSL/TLS-Zertifikat einrichten
- Bevor Sie HTTP auf HTTPS umleiten können, stellen Sie sicher, dass ein gültiges SSL/TLS-Zertifikat auf dem Domino-Server installiert ist.
- Das Zertifikat kann entweder von einer Zertifizierungsstelle (CA) ausgestellt sein oder ein selbstsigniertes Zertifikat sein.
- Gehen Sie im Domino Administrator zu **Konfiguration** -> **Server** -> **Alle Serverdokumente** und öffnen Sie das Serverdokument.
- Wechseln Sie zum Reiter **Internetprotokolle** -> **HTTP** und stellen Sie sicher, dass SSL aktiviert ist.
- Laden Sie das Zertifikat in den entsprechenden Bereich hoch und konfigurieren Sie die SSL-Einstellungen nach Bedarf.

#### 7.2 HTTP-Einstellungen anpassen
- Im Domino Administrator navigieren Sie zu **Konfiguration** -> **Server** -> **Internet-Sites** oder **Web Sites**, je nach Konfiguration.
- Öffnen Sie die Website-Konfiguration, die Sie anpassen möchten.

#### 7.3 Redirect von HTTP auf HTTPS konfigurieren
- Gehen Sie im Konfigurationsdokument der Website zum Reiter **Sicherheit**.
- Aktivieren Sie die Option **SSL-Anforderungen erzwingen** oder **HTTPS-Umleitung aktivieren**. Dies bewirkt, dass alle HTTP-Anfragen automatisch auf HTTPS umgeleitet werden.
- Alternativ können Sie auch eine Regel im Bereich **Web Rules** erstellen:
  - Erstellen Sie eine neue Regel für **Redirection**.
  - Stellen Sie sicher, dass die Regel den HTTP-Port 80 als Quelle und den HTTPS-Port 443 als Ziel definiert.
  - Konfigurieren Sie die Regel so, dass alle Anfragen auf Port 80 auf den entsprechenden HTTPS-Pfad weitergeleitet werden.

#### 7.4 Änderungen speichern und den Server neu starten
- Speichern Sie alle Änderungen, indem Sie auf **Speichern und schließen** klicken.
- Starten Sie den Domino-Server neu, damit die Änderungen wirksam werden.

### 8. Überprüfung der Umleitung
- Nachdem der Server neu gestartet wurde, testen Sie die Umleitung:
  - Geben Sie die HTTP-Adresse der Website ein, z. B. `http://example.com`.
  - Sie sollten automatisch auf die HTTPS-Version, z. B. `https://example.com`, umgeleitet werden.

Durch diese Schritte deaktivierst Du den klassischen Webserver in Domino und stellst sicher, dass nur die gewünschten Anwendungen ausgeführt werden.
Alle unverschlüsselten HTTP-Anfragen werden automatisch auf den sicheren HTTPS-Port umgeleitet, was die Sicherheit der Verbindung verbessert.
