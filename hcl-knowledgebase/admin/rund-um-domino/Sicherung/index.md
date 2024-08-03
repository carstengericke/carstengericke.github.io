# Sicherung

Dieser Abschnitt beschreibt Sicherheitsfunktionen, einschließlich Ausführungskontrolllisten, IDs und TLS.

## [Überblick über Domino-Sicherheit](Überblick über Domino-Sicherheit)

Die Einrichtung der Sicherheit für deine Organisation ist eine kritische Aufgabe. Deine Sicherheitsinfrastruktur ist entscheidend, um die IT-Ressourcen und Vermögenswerte deiner Organisation zu schützen. Als Administrator musst du die Sicherheitsanforderungen deiner Organisation sorgfältig berücksichtigen, bevor du Server oder Benutzer einrichtest. Vorausplanung zahlt sich später aus, indem sie das Risiko von kompromittierter Sicherheit minimiert.

## Serverzugriff für Notes-Benutzer, Internet-Benutzer und Domino-Server

Um den Benutzer- und Serverzugriff auf andere Server zu steuern, verwendet Domino die von dir auf der Registerkarte „Sicherheit“ im Serverdokument angegebenen Einstellungen sowie die Regeln der Validierung und Authentifizierung. Wenn ein Server den Notes-Benutzer, Internet-Benutzer oder Server validiert und authentifiziert und die Einstellungen im Serverdokument den Zugriff erlauben, wird dem Benutzer oder Server der Zugriff auf den Server gestattet.

## Die Zugriffssteuerungsliste der Datenbank

Jede .NSF-Datenbank hat eine Zugriffssteuerungsliste (ACL), die das Zugriffslevel der Benutzer und Server auf diese Datenbank angibt. Obwohl die Namen der Zugriffslevel für Benutzer und Server gleich sind, bestimmen die den Benutzern zugewiesenen Level die Aufgaben, die sie in einer Datenbank ausführen können, während die den Servern zugewiesenen Level bestimmen, welche Informationen innerhalb der Datenbank die Server replizieren können. Nur jemand mit Managerzugriff kann die ACL erstellen oder ändern.

## Domino-Server- und Notes-Benutzer-IDs

Domino verwendet ID-Dateien, um Benutzer zu identifizieren und den Zugriff auf Server zu steuern. Jeder Domino-Server, Notes-Zertifizierer und Notes-Benutzer muss eine ID haben.

## Die Ausführungskontrollliste

Du verwendest eine Ausführungskontrollliste (ECL), um die Datensicherheit der Workstation zu konfigurieren. Eine ECL schützt Benutzerarbeitsstationen vor aktivem Inhalt aus unbekannten oder verdächtigen Quellen und kann so konfiguriert werden, dass die Aktion eines jeden aktiven Inhalts, der auf den Arbeitsstationen ausgeführt wird, eingeschränkt wird.

## Domino-Server-basierte Zertifizierungsstelle

Du kannst einen Domino-Zertifizierer einrichten, der den CA-Prozess-Server-Task verwendet, um Zertifikatanfragen zu verwalten und zu verarbeiten. Der CA-Prozess läuft als Prozess auf Domino-Servern, die Zertifikate ausstellen. Wenn du einen Notes- oder Internet-Zertifizierer einrichtest, verknüpfst du ihn mit dem CA-Prozess auf dem Server, um die Vorteile der CA-Prozessaktivitäten zu nutzen. Auf einem Server kann nur eine Instanz des CA-Prozesses ausgeführt werden; der Prozess kann jedoch mit mehreren Zertifizierern verknüpft werden.

## TLS-Sicherheit

Transport Layer Security (TLS) ist ein Sicherheitsprotokoll, das Kommunikationsprivatsphäre und Authentifizierung für Domino-Server-Tasks bietet, die über TCP/IP betrieben werden.

## TLS und S/MIME für Clients

Clients können eine Domino-Zertifizierungsstelle (CA)-Anwendung oder eine Drittanbieter-CA verwenden, um Zertifikate für sichere TLS- und S/MIME-Kommunikation zu erhalten.

## Verschlüsselung

Verschlüsselung schützt Daten vor unbefugtem Zugriff.

## Webbasierte Authentifizierung

Definiere und richte Authentifizierungsmethoden für Webbenutzer ein, zum Beispiel durch grundlegende Passwortauthentifizierung, Passkeys, zeitbasierte Einmalpasswörter oder Single Sign-On.

## Verwendung eines Anmeldeinformationsspeichers zum Speichern von Anmeldeinformationen

Ein Domino-Server kann eine Anmeldeinformationsspeicheranwendung als sicheres Artefakt-Repository verwenden. Beispiele für sichere Artefakte sind Authentifizierungsanmeldeinformationen und Sicherheitsschlüssel.

## Unterstützten Schlüssellängen in Notes und Domino

Verstehe die von Notes und Domino unterstützten RSA-Schlüssellängen von früheren Versionen bis zur aktuellen Version.
