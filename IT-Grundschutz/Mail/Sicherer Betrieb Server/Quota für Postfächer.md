
### Schritte zur Konfiguration einer Quota für Postfächer:

1. **Domino Administrator öffnen**:
   - Öffne den Domino Administrator und verbinde dich mit dem Domino-Server, auf dem sich die Postfächer befinden.

2. **Mail-Datenbank auswählen**:
   - Wähle unter dem Reiter "Dateien" die Mail-Datenbank(en) aus, für die du eine Quota festlegen möchtest. Dies können einzelne Datenbanken oder mehrere ausgewählte Datenbanken sein.

3. **Datenbankeigenschaften öffnen**:
   - Rechtsklicke auf die ausgewählte Datenbank und wähle "Größenbeschränkungen..." aus dem Kontextmenü.

4. **Quota-Einstellungen konfigurieren**:
   - Gehe auf den Reiter, der durch ein Informationssymbol (i) gekennzeichnet ist (der erste Reiter in den Datenbankeigenschaften).
   - In den "Quota"-Feldern kannst du die Größe in Megabyte (MB) festlegen:
     - **Quota**: Die maximale Größe, die die Mail-Datenbank erreichen darf.
     - **Warnungsgrenze**: Die Größe, bei der eine Warnung an den Benutzer gesendet wird, dass das Postfach seine Kapazität bald erreicht.

5. **Erweiterte Einstellungen (optional)**:
   - Es gibt zusätzliche Optionen, wie z.B. das Erzwingen von Quota-Beschränkungen oder das Festlegen von unterschiedlichen Quotas basierend auf Richtlinien.
   - Diese Einstellungen können über **Mail-Richtlinien** zentral verwaltet werden, was besonders in größeren Umgebungen nützlich ist.

6. **Änderungen speichern**:
   - Nachdem du die gewünschten Einstellungen vorgenommen hast, schließe das Fenster und speichere die Änderungen.

7. **Testen und Überprüfen**:
   - Stelle sicher, dass die Quota korrekt angewendet wurde, indem du das Postfach überprüfst oder einen Testbenutzer verwendest, um die Benachrichtigungen und Quota-Limits zu testen.

### Verwaltung über Mail-Richtlinien (Optional):
Wenn du Quotas für viele Benutzer gleichzeitig verwalten möchtest, empfiehlt es sich, **Mail-Richtlinien** zu verwenden:

1. Gehe zu den "Richtlinien" im Domino Administrator.
2. Erstelle oder bearbeite eine vorhandene Mail-Richtlinie.
3. Im Abschnitt "Mail" kannst du die Quota-Einstellungen definieren.
4. Weise die Richtlinie den gewünschten Benutzergruppen zu.

Diese Vorgehensweise erleichtert die zentrale Verwaltung und stellt sicher, dass die Einstellungen konsistent über alle betroffenen Benutzer angewendet werden.

### Fazit:
Durch das Festlegen von Quotas auf den Mail-Datenbanken in HCL Domino kannst du die Speichernutzung effektiv kontrollieren und sicherstellen, dass keine Postfächer übermäßig viel Speicherplatz beanspruchen. Dies kann sowohl manuell für einzelne Postfächer als auch zentral über Richtlinien für mehrere Benutzer gleichzeitig erfolgen.