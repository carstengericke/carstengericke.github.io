Bei HCL Domino Web-Anwendungen gibt es verschiedene Authentifizierungsmethoden, die eingesetzt werden können, um die Sicherheit und den Zugang zu den Anwendungen zu gewährleisten. Hier sind einige der wichtigsten Methoden:

1. **Basic Authentication**:
   - Benutzer müssen einen Benutzernamen und ein Passwort eingeben.
   - Die Authentifizierung erfolgt über HTTP-Header.

2. **Form-based Authentication**:
   - Benutzer werden zu einer Anmeldeseite weitergeleitet, wo sie ihre Anmeldedaten eingeben.
   - Nach der Eingabe wird ein Authentifizierungs-Token generiert, das für die Dauer der Sitzung gültig ist.

3. **SSL/TLS Client Authentication**:
   - Verwendet digitale Zertifikate zur Authentifizierung von Benutzern.
   - Erfordert die Einrichtung einer Public Key Infrastructure (PKI) und die Verteilung von Client-Zertifikaten.

4. **Domino Single Sign-On (SSO)**:
   - Ermöglicht Benutzern den Zugang zu mehreren Domino-Anwendungen mit einer einzigen Anmeldung.
   - Kann mit anderen SSO-Lösungen integriert werden, um nahtlosen Zugang zu verschiedenen Anwendungen zu ermöglichen.

5. **Directory Assistance**:
   - Integration mit externen Verzeichnisdiensten wie LDAP zur Authentifizierung von Benutzern.
   - Ermöglicht die Verwaltung von Benutzerkonten und -rechten über ein zentrales Verzeichnis.

6. **Token-based Authentication**:
   - Verwendung von JWT (JSON Web Tokens) oder anderen Token-Formaten zur Authentifizierung.
   - Token werden nach der erfolgreichen Anmeldung generiert und für nachfolgende Anfragen verwendet.

7. **OAuth 2.0**:
   - Ein modernes, tokenbasiertes Authentifizierungs- und Autorisierungsframework.
   - Ermöglicht die Authentifizierung über Drittanbieter wie Google, Facebook oder andere OAuth-Provider.

8. **SAML (Security Assertion Markup Language)**:
   - Ein XML-basiertes Framework für den Austausch von Authentifizierungs- und Autorisierungsdaten zwischen verschiedenen Parteien.
   - Wird oft für Single Sign-On (SSO) in Unternehmensumgebungen verwendet.

9. **Kerberos**:
   - Ein Netzwerk-Authentifizierungsprotokoll, das Ticket-basierte Authentifizierung verwendet.
   - Bietet eine sichere Methode zur Authentifizierung in ungesicherten Netzwerken.

10. **X.509-Zertifikate**:
    - Verwendet digitale Zertifikate, die nach dem X.509-Standard erstellt wurden, zur Authentifizierung von Benutzern und Servern.
    - Oftmals in Verbindung mit SSL/TLS eingesetzt.

Diese Methoden können einzeln oder in Kombination verwendet werden, um die Sicherheit und Benutzerfreundlichkeit von HCL Domino Web-Anwendungen zu verbessern. Die Wahl der geeigneten Authentifizierungsmethode hängt von den spezifischen Anforderungen und der Infrastruktur der Organisation ab.


Anforderung ist, das Single Sign-On (SSO) zwischen HCL Verse und HCL Sametime genutzt werden kann. Dafür sind folgende Authentifizierungsmethoden erforderlich. Hier das Vorgehen zur Einrichtung:

1. **Domino SSO-Konfiguration**:
   - Stelle sicher, dass Domino SSO auf deinem HCL Domino-Server korrekt konfiguriert ist.
   - Erstelle ein SSO-Dokument im Domino-Verzeichnis, das die HCL Verse- und HCL Sametime-Server umfasst.

2. **LTPA (Lightweight Third-Party Authentication)**:
   - Verwende LTPA-Tokens für die Authentifizierung. Diese Tokens werden bei der Installation von Sametime mit WebsphereLiberty erstellt und können zwischen den Anwendungen geteilt werden.
   - Konfiguriere die LTPA-Token-Einstellungen in der Domino-Administrationsoberfläche und stelle sicher, dass dieselben LTPA-Schlüssel auf beiden Servern verwendet werden.
[s. LTPA Schlüssel](LTPA Schlüssel)

3. **Web-SSO-Konfigurationsdokument**:
   - Erstelle ein Web-SSO-Konfigurationsdokument in der Domino-Verzeichnis-Datenbank.
   - Füge die HCL Verse- und HCL Sametime-Server zu diesem Dokument hinzu, damit sie die gleichen SSO-Einstellungen verwenden.

4. **Domino Directory Assistance**:
   - Stelle sicher, dass alle Domino-Server Zugriff auf dasselbe Verzeichnis haben oder Verzeichnisunterstützung verwenden, damit Benutzerinformationen einheitlich verwaltet werden können.

5. **SSL/TLS**:
   - Konfiguriere SSL/TLS auf beiden Servern, um eine sichere Kommunikation zu gewährleisten.
   - Stelle sicher, dass beide Server über gültige SSL-Zertifikate verfügen und dass die Kommunikation zwischen ihnen verschlüsselt ist.

6. **Konfiguration der Web-Servereinstellungen**:
   - Stelle sicher, dass die Web-Servereinstellungen auf beiden Servern so konfiguriert sind, dass sie SSO unterstützen.
   - Überprüfe die Einstellungen im Domino Web Server Configuration-Dokument.

7. **Verbindung zwischen HCL Verse und HCL Sametime**:
   - Konfiguriere die Integration zwischen HCL Verse und HCL Sametime, sodass Benutzer direkt von Verse aus auf Sametime zugreifen können, ohne sich erneut anmelden zu müssen.

Zusammengefasst sind die wichtigsten Schritte die Einrichtung von Domino SSO und die Verwendung von LTPA-Tokens. Diese Konfiguration stellt sicher, dass Benutzer sich einmal authentifizieren und nahtlos zwischen HCL Verse und HCL Sametime wechseln können.