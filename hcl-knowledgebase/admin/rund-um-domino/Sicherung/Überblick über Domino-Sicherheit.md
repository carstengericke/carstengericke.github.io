# Überblick über Domino-Sicherheit

Die Einrichtung der Sicherheit für deine Organisation ist eine kritische Aufgabe. Deine Sicherheitsinfrastruktur ist unerlässlich, um die IT-Ressourcen und Vermögenswerte deiner Organisation zu schützen. Als Administrator musst du die Sicherheitsanforderungen deiner Organisation sorgfältig berücksichtigen, bevor du Server oder Benutzer einrichtest. Vorausplanung zahlt sich später aus, indem sie das Risiko von kompromittierter Sicherheit minimiert.

Verwende die folgenden Aufgaben, um dich durch deine Sicherheitsplanung zu führen:

- Das Geschäft kennen.
- Vermögenswerte und Bedrohungen identifizieren (Risikobewertung).
- Strategien zum Schutz deiner Computerumgebung entwickeln.
- Verfahren zur Vorfallbehandlung entwickeln.
- Mitarbeiterschulungen planen und durchführen.
- Prozesse aktuell halten.

## Das Geschäft kennen

Dies ist der Prozess, die geschäftlichen Anforderungen deiner Organisation und die erforderlichen Servicelevel zu verstehen. Identifiziere alle Komponenten des Geschäfts, einschließlich solcher, die nicht in deiner direkten Verantwortung liegen. Berücksichtige neue Übernahmen und kürzliche Abspaltungen. Identifiziere das vertrauenswürdige Netzwerk und das nicht vertrauenswürdige Netzwerk; in einigen Fällen kann ein Extranet eine Erweiterung eines vertrauenswürdigen Netzwerks sein.

Sobald du die geschäftlichen Anforderungen verstanden hast, kannst du mit der Planung der spezifischen Domino-Infrastruktur beginnen, einschließlich:

- Wird mehr als eine Domino-Domäne benötigt oder muss die neue Domäne mit bestehenden Domänen interagieren?
- Was ist die beste Methode, um Domino-Daten im Internet zugänglich zu machen?
- Welche Servicelevel werden benötigt, um das Geschäft zu unterstützen?
- Wer sollte welches Zugriffslevel auf das Domino-Verzeichnis haben?

## Vermögenswerte und Bedrohungen identifizieren (Risikobewertung)

Identifiziere den Wert der Vermögenswerte, die du schützen möchtest. Anwendungen in deiner Organisation haben unterschiedliche Werte. Beispielsweise ist in den meisten Organisationen die Verfügbarkeit der E-Mail-Infrastruktur für das Geschäft unerlässlich, aber die sofortige Verfügbarkeit aller früheren E-Mails ist weniger wichtig. Identifiziere dann die Bedrohungen aus interner und externer Perspektive. Verstehe den potenziellen Verlust für deine Organisation, wenn eine der Bedrohungen erfolgreich ist. Bestimme schließlich die Wahrscheinlichkeit der Bedrohung. Beispielsweise ist ein automatisierter Angriff von einem kompromittierten System nahezu sicher, ein Serverraumausfall durch Wasserschäden ist eine deutliche Möglichkeit, während der Diebstahl einer Serverfestplatte aus dem Rechenzentrum normalerweise nicht wahrscheinlich ist.

Es gibt viele verschiedene Arten von Bedrohungen für jede Computerinfrastruktur:

- Umweltzerstörung
- Automatisierte Angriffe oder Hacker aus dem Internet
- Automatisierte Angriffe von kompromittierten Systemen in deinem Intranet
- Schnittstellen mit weniger sicheren Systemen
- Fehler von ungeschulten oder schlecht ausgebildeten Benutzern und Administratoren
- Datenabfang oder -änderung für kriminellen Gewinn
- Böswillige Aktivitäten ehemaliger Mitarbeiter

Du solltest auch das Domino-Sicherheitsmodell verstehen, um besser zu verstehen, welche Domino-Vermögenswerte du schützen musst und wie sie geschützt werden können.

## Strategien zum Schutz deiner Computerumgebung entwickeln

Sobald du die potenziellen Bedrohungen für deine Domino-Umgebung verstanden hast, kannst du Richtlinien erstellen, um jeden Teil deiner Domino-Computing-Infrastruktur zu schützen. Dies kann die Entwicklung von Richtlinien für folgende Bereiche umfassen:

- Beschränkungen des physischen Zugriffs auf deine Server
- Netzwerkzugriff und -schutz
- Messaging-Infrastruktur, durch die Verwendung von Ausführungskontrolllisten und Antivirenprodukten
- Anwendungssicherheit durch Verschlüsselung und ACL-Management
- Verwaltung von Verschlüsselungsschlüsseln, einschließlich ID-Wiederherstellung
- Benutzerschulung für organisatorische Sicherheitsregeln und -technologie
- Berichterstattung über Sicherheitsvorfälle

Weitere Informationen zur Änderungssteuerung findest du in den zugehörigen Themen.

## Verfahren zur Vorfallbehandlung entwickeln

Ein Vorfall ist ein ungeplantes und unerwartetes Ereignis, das sofortige Maßnahmen erfordert, um einen Verlust von Geschäft, Vermögenswerten oder öffentlichem Vertrauen zu verhindern. Alle Sicherheitspläne müssen eine Vorfallbehandlungskomponente und eine Feedback-Komponente für die Handhabung von Vorfällen haben. Feedback hilft, Sicherheitspläne und -richtlinien aktuell zu halten.

Hinweis: Eines der besten Dokumente, das die Bedeutung der Vorfallbehandlung beschreibt, ist der Contingency Planning Guide for Information Technology Systems des National Institute of Standards and Technology (NIST Special Publication 800-34).

Die Vorfallbehandlung umfasst:

- Vorfallberichterstattungspläne und -methoden
- Reaktionsverfahren für jeden Vorfalltyp
- Vorfallreaktionstests

Sobald du deine Pläne zur Vorfallbehandlung erstellt hast, kannst du besser deine Anforderungen an:

- Domino-Protokollierung
- Domino-HTTP-Protokollierung
- Domino-Backup und Wiederherstellung
- Parameter für die Domino-Ereignisüberwachung

## Mitarbeiterschulungen planen und durchführen

Stelle sicher, dass deine Benutzer wissen, dass Sicherheit jedermanns Verantwortung ist. Basierend auf deinen geschäftlichen Anforderungen schule deine Benutzer in:

- Domino-Sicherheitsgrundlagen
- Notes-IDs und wie man sie schützt
- Notes-Ausführungskontrolllisten und Ausführungssicherheitswarnungen
- Verwendung von Verschlüsselung und wie man eine E-Mail-Nachricht verschlüsselt
- Wen man im Falle eines Problems oder eines Sicherheitsvorfalls anruft

Hinweis: Das National Institute of Standards and Technology veröffentlichte ein Dokument über die Beziehung zwischen Sicherheitsbewusstsein, Schulung und Bildung mit dem Titel Information Technology Security Training Requirements: A Role- and Performance-Based Model (NIST Special Publication 800-16).

## Prozesse aktuell halten

Dieser Schritt ist normalerweise der schwierigste, aber genauso wichtig wie alle anderen Schritte. Etabliere ein Programm zur regelmäßigen Überprüfung von Sicherheitsprozessen und -verfahren. Verknüpfe die Überprüfung mit der Mitarbeiterschulung. Wenn Änderungen vorgenommen werden, muss möglicherweise auch die Mitarbeiterschulung aktualisiert werden.

## Verwandte Informationen

- [Das Domino-Sicherheitsmodell](https://help.hcl-software.com/domino/14.0.0/admin/othr_domino_security_model_c.html)
- [Die Domino-Server-Protokolldatei (LOG.NSF)](https://help.hcl-software.com/domino/14.0.0/admin/othr_domino_logfile_c.html)
- [Das Domino-Webserver-Protokoll (DOMLOG.NSF)](https://help.hcl-software.com/domino/14.0.0/admin/othr_domino_web_logfile_c.html)
- [Backup des Domino-Servers](https://help.hcl-software.com/domino/14.0.0/admin/othr_domino_backup_c.html)
- [Überwachung von Ereignissen im Domino-System](https://help.hcl-software.com/domino/14.0.0/admin/othr_domino_monitoring_events_c.html)
- [Contingency Planning Guide for IT Systems auf csrc.nist.gov](https://csrc.nist.gov/publications/detail/sp/800-34/rev-1/final)
