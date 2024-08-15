**DAOS (Domino Attachment and Object Service)** ist eine Funktion in HCL Domino, die dazu dient, den Speicherplatzverbrauch von E-Mail-Datenbanken (NSF-Dateien) zu reduzieren und die Effizienz der Datenverwaltung zu verbessern. Hier sind die wesentlichen Merkmale und Vorteile von DAOS:

### **Funktion von DAOS**
- **Zentrale Speicherung von Anhängen:** DAOS extrahiert Anhänge aus E-Mails und speichert sie einmalig in einem zentralen Speicherort, dem sogenannten DAOS-Speicherpool. Anstelle der Anhänge werden in den E-Mails nur Referenzen auf diese Dateien abgelegt.
- **Vermeidung von Duplikaten:** Wenn ein Anhang in mehreren E-Mails vorhanden ist (z.B. ein großes PDF-Dokument, das an viele Empfänger gesendet wird), speichert DAOS den Anhang nur einmal und verlinkt ihn zu den entsprechenden E-Mails. Dies reduziert die Redundanz erheblich.

### **Vorteile von DAOS**
- **Speicherplatzersparnis:** Durch die zentrale Speicherung und Vermeidung von Duplikaten kann der benötigte Speicherplatz für E-Mail-Datenbanken signifikant reduziert werden. Dies ist besonders nützlich in Umgebungen mit großen Mengen an E-Mail-Verkehr.
- **Effiziente Backup-Prozesse:** Da DAOS die Anhänge zentral speichert, müssen diese nicht mehrfach gesichert werden. Das bedeutet, dass Backups schneller und effizienter durchgeführt werden können, da nur die Referenzen und die zentrale Datei gesichert werden müssen.
- **Verbesserte Performance:** DAOS kann dazu beitragen, die Leistung der Domino-Server zu verbessern, da die Größe der E-Mail-Datenbanken reduziert wird, was wiederum zu schnelleren Zugriffen und kürzeren Ladezeiten führen kann.
- **Einfache Verwaltung:** DAOS wird über das Domino-Administrator-Tool konfiguriert und verwaltet. Es bietet eine klare Übersicht und Kontrolle über die gespeicherten Anhänge und deren Referenzen.

### **Wie DAOS funktioniert**
- **Aktivierung:** Der Administrator aktiviert DAOS auf dem Domino-Server und legt fest, ab welcher Dateigröße Anhänge ausgelagert werden sollen.
- **Speicherung:** Beim Speichern einer E-Mail prüft Domino, ob der Anhang bereits im DAOS-Speicherpool existiert. Falls ja, wird nur eine Referenz gespeichert; falls nicht, wird der Anhang in den DAOS-Pool verschoben.
- **Zugriff:** Wenn ein Benutzer eine E-Mail mit einem DAOS-verknüpften Anhang öffnet, wird der Anhang aus dem zentralen DAOS-Speicher abgerufen und angezeigt, als ob er weiterhin in der E-Mail gespeichert wäre.

### **Zusammenfassung**
DAOS ist ein leistungsstarkes Tool in HCL Domino, das die Effizienz der Speicherverwaltung durch die zentrale und deduplizierte Speicherung von E-Mail-Anhängen verbessert. Es bietet Vorteile in Bezug auf Speicherplatz, Performance und Backup-Effizienz und ist besonders in großen Unternehmensumgebungen von Bedeutung, wo große Mengen an E-Mails und Anhängen verwaltet werden müssen.