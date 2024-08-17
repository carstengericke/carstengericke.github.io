
### **Nützliche Kommandos in HCL Domino**

| **Kommando**          | **Kurzbeschreibung**  |
|-----------------------|-----------------------|
| **Server-Status und -Überwachung** | |
| `show server`         | Zeigt den aktuellen Status des Domino-Servers an, einschließlich Informationen über laufende Aufgaben und die allgemeine Servergesundheit. |
| `show tasks`          | Zeigt alle laufenden Aufgaben auf dem Domino-Server an, einschließlich deren Status. Hilfreich zur Überwachung und Diagnose von Serverproblemen. |
| `tell router show`    | Zeigt den aktuellen Status des Router-Dienstes und listet alle aktiven Mail-Prozesse auf. Nützlich zur Überprüfung des E-Mail-Verkehrs und möglicher Fehler. |
| `show sched`          | Zeigt den aktuellen Zeitplan von Benutzern oder Ressourcen an, um deren Verfügbarkeit für Besprechungen oder andere geplante Ereignisse zu überprüfen. |
| **Dienststeuerung** | |
| `restart task http`   | Startet den HTTP-Dienst neu, beispielsweise nach einer Änderung der Konfiguration. Dieser Befehl ist nützlich, um Änderungen an der Webserver-Konfiguration zu übernehmen, ohne den gesamten Server neu zu starten. |
| `restart task ldap`   | Startet den LDAP-Dienst neu. Dieser Befehl ist nützlich, wenn Änderungen an der LDAP-Konfiguration vorgenommen wurden und diese übernommen werden sollen. |
| `tell router quit`    | Beendet den Router-Dienst. Dies ist nützlich, wenn der Router-Dienst beendet werden muss, z.B. für Wartungsarbeiten oder Konfigurationsänderungen. |
| `load router`         | Startet den Router-Dienst neu, nachdem er gestoppt wurde. Dieser Befehl wird verwendet, um den E-Mail-Verkehr nach Wartungsarbeiten wiederherzustellen. |
| `restart server`      | Führt einen Neustart des gesamten Domino-Servers durch. Dieser Befehl wird verwendet, wenn umfangreiche Änderungen vorgenommen wurden, die einen Serverneustart erfordern. |
| **Backup-Management** | |
| `load backup`         | Startet den Backup-Prozess in HCL Domino. Es wird verwendet, um Datenbanken zu sichern und Datenverluste zu vermeiden. Die genauen Parameter hängen von der Konfiguration und den verwendeten Backup-Tools ab. |

