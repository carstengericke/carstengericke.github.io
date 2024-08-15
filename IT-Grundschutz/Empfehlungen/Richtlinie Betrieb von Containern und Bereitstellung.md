
### Richtlinie für den Betrieb von Containern und die Verwendung sowie Bereitstellung erlaubter Images

**Zweck:**
Diese Richtlinie legt die Anforderungen und Standards für den sicheren Betrieb von Containern sowie die Auswahl, Bereitstellung und Verwendung von Container-Images in der Produktionsumgebung fest. Ziel ist es, die Sicherheit, Integrität und Zuverlässigkeit der containerisierten Anwendungen zu gewährleisten.

---

**1. Allgemeine Anforderungen an den Betrieb von Containern**

1.1 **Sichere Konfiguration und Betrieb**
   - Container müssen gemäß den bewährten Sicherheitspraktiken konfiguriert werden. Dazu gehört die Minimierung der Privilegien, die dem Container gewährt werden, und die Ausführung von Containern mit den geringsten erforderlichen Rechten.
   - Root-Berechtigungen sollten vermieden werden. Container dürfen nicht als Root-Benutzer laufen, es sei denn, es ist absolut notwendig und wurde von der Sicherheitsabteilung genehmigt.
   - Netzwerkzugriff zwischen Containern sollte auf das notwendige Minimum beschränkt und durch Netzwerkpolicies geschützt werden.

1.2 **Ressourcenlimits**
   - Jeder Container muss mit klar definierten CPU-, RAM- und Speicherlimits betrieben werden, um die Stabilität des Gesamtsystems sicherzustellen. Diese Limits sind in den Kubernetes-Deployments oder Docker-Konfigurationen zu setzen.
   - Container, die ihre Ressourcenlimits überschreiten, müssen überwacht werden. Alarme sollten ausgelöst werden, wenn ein Container kontinuierlich an seine Ressourcengrenzen stößt.

1.3 **Sicherheits- und Compliance-Prüfungen**
   - Container müssen regelmäßig auf Sicherheitslücken gescannt werden, bevor sie in die Produktion überführt werden. Dies umfasst das Scannen der Basis-Images sowie der installierten Softwarepakete.
   - Es müssen regelmäßige Überprüfungen durchgeführt werden, um sicherzustellen, dass alle Container den internen Sicherheitsrichtlinien und externen Compliance-Anforderungen entsprechen.

---

**2. Anforderungen an die Auswahl und Verwendung von Container-Images**

2.1 **Zugelassene Image-Quellen**
   - Es dürfen nur Container-Images aus vertrauenswürdigen Quellen und offiziellen Repositories verwendet werden. Diese umfassen:
     - **Docker Hub:** Für Images von anerkannten Projekten (z.B. `prom/prometheus`, `grafana/grafana`).
     - **Google Container Registry (`gcr.io`):** Für Google-basierte Images.
     - **Quay.io:** Für Community-unterstützte Projekte (z.B. `quay.io/metallb/controller`).
     - **HCL Container Registry (`hclcr.io`):** Für spezifische Anwendungen wie HCL Domino und HCL Sametime.

2.2 **Verbotene Images**
   - Container-Images aus unbekannten oder nicht verifizierten Quellen sind verboten. Insbesondere dürfen keine Images verwendet werden, die aus inoffiziellen oder privaten Repositories stammen, es sei denn, diese wurden durch das IT-Sicherheitsteam genehmigt und freigegeben.
   - Das Einbinden von Images, die Zugangsdaten, Passwörter oder andere sensible Informationen im Klartext enthalten, ist strengstens untersagt.

2.3 **Sicherheitsanforderungen an Images**
   - Jedes Container-Image muss vor der Nutzung in der Produktion auf bekannte Sicherheitslücken geprüft werden. Tools wie Trivy, Clair oder Anchore sind für diesen Zweck zu verwenden.
   - Images müssen regelmäßig aktualisiert und neu bewertet werden, um Sicherheitsupdates zu integrieren. Veraltete oder unsichere Images dürfen nicht verwendet werden.
   - Basis-Images sollten so schlank wie möglich gehalten werden und nur die notwendigen Abhängigkeiten enthalten. Dies minimiert die Angriffsfläche.

2.4 **Speicherung von Zugangsdaten**
   - Zugangsdaten dürfen nicht direkt im Container-Image gespeichert werden. Stattdessen müssen sie in speziell gesicherten Umgebungen, wie Kubernetes Secrets oder Vault, verwaltet werden.
   - Die Verwaltung von Zugangsdaten muss sicherstellen, dass nur autorisierte Container und Benutzer Zugriff auf die benötigten Daten haben.

---

**3. Anforderungen an den Betrieb und die Bereitstellung von Container-Images**

3.1 **Image-Signatur und Verifizierung**
   - Alle Container-Images, die in der Produktion eingesetzt werden, sollten digital signiert sein, um sicherzustellen, dass die Integrität und Herkunft der Images verifiziert werden kann.
   - Vor dem Einsatz eines Images in der Produktion muss die Signatur überprüft werden, um sicherzustellen, dass das Image nicht manipuliert wurde und aus einer vertrauenswürdigen Quelle stammt.

3.2 **Registrierung und Speicherung**
   - Aktuell werden Container-Images in den öffentlichen Registries von HCL, Docker Hub und Quay.io gespeichert. Diese Repositories werden als vertrauenswürdig angesehen und dürfen verwendet werden.
   - Sollte in Zukunft eine eigene Container-Registry eingerichtet werden, muss diese Registry zentral verwaltet und abgesichert werden. Der Zugriff auf die Registry muss streng kontrolliert und auf autorisierte Benutzer und Systeme beschränkt werden.

3.3 **Deployment**
   - Der Deployment-Prozess muss sicherstellen, dass nur geprüfte und genehmigte Images in die Produktion überführt werden. Automatisierte Tests und Scans sollten Teil des Deployment-Prozesses sein, um die Sicherheit und Integrität der Images zu gewährleisten.
   - Im Deployment-Prozess müssen Mechanismen zur Überwachung und zum automatischen Rollback fehlerhafter Deployments integriert sein. Falls Probleme festgestellt werden, sollte das System in der Lage sein, automatisch auf eine stabile Version zurückzusetzen.

---

**4. Überwachung und Audit**

4.1 **Protokollierung**
   - Alle Zugriffe auf Container, ihre Konfigurationen und verwendete Images müssen protokolliert werden. Diese Protokolle sind regelmäßig zu überprüfen, um unbefugte Zugriffsversuche zu identifizieren.

4.2 **Audits**
   - Es sind regelmäßige Audits durchzuführen, um sicherzustellen, dass alle Container-Umgebungen und Images den in dieser Richtlinie festgelegten Anforderungen entsprechen.
   - Abweichungen von der Richtlinie müssen dokumentiert und umgehend behoben werden.

---

**5. Schulung und Sensibilisierung**

5.1 **Mitarbeiterschulung**
   - Alle Mitarbeiter, die mit Containerisierung und dem Betrieb von Containern befasst sind, müssen regelmäßig geschult werden, um sicherzustellen, dass sie die Sicherheitsanforderungen und Best Practices kennen und anwenden.

5.2 **Sicherheitsbewusstsein**
   - Das Bewusstsein für Sicherheitsrisiken im Zusammenhang mit Containern und Images muss gefördert werden. Regelmäßige Workshops und Schulungen sind durchzuführen, um aktuelle Bedrohungen und Sicherheitslücken zu thematisieren.

