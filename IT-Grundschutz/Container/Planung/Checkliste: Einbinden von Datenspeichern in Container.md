### Checkliste: Einbinden von Datenspeichern in Container

#### 1. **Minimaler Zugriff auf Speicher**
   - [ ] **Binde nur notwendige Verzeichnisse und Volumes ein:** Stelle sicher, dass Du nur die für den Betrieb des Containers notwendigen Massenspeicher und Verzeichnisse einbindest.
   - [ ] **Vermeide unnötige Mounts:** Prüfe, dass Du keine überflüssigen Speicherressourcen oder Verzeichnisse mountest, die der Container nicht benötigt.

#### 2. **Sicherheitskonfiguration von Zugriffsrechten**
   - [ ] **Beschränke die Zugriffsrechte:** Setze die Zugriffsrechte auf eingebundene Speicherressourcen so, dass nur der Service-Account des Containers darauf zugreifen kann.
   - [ ] **Verwende Read-Only Mounts:** Wenn möglich, verwende read-only Mounts für Verzeichnisse, auf die der Container nur lesend zugreifen muss.
   - [ ] **Setze Berechtigungen auf dem Netzwerkspeicher:** Stelle sicher, dass bei der Verwendung von Netzwerkspeichern (z.B. NFS, SMB, Ceph) die Zugriffsberechtigungen direkt auf dem Netzwerkspeicher selbst konfiguriert sind.

#### 3. **Isolierung und Schutz des Host-Systems**
   - [ ] **Schütze das Host-System vor unbefugtem Zugriff:** Stelle sicher, dass eingebundene Volumes und Verzeichnisse keinen zu weitreichenden Zugriff auf das Host-Dateisystem gewähren.
   - [ ] **Nutze Security Contexts:** Verwende Kubernetes Security Contexts, um sicherzustellen, dass der Container nur mit den notwendigen Berechtigungen läuft (z.B. `runAsUser`, `runAsGroup`).

#### 4. **Verwaltung von Persistent Volumes**
   - [ ] **Konfiguriere Persistent Volumes (PV) korrekt:** Vergewissere Dich, dass die Persistent Volumes so konfiguriert sind, dass sie den gewünschten Zugriff auf den Speicher ermöglichen.
   - [ ] **Überprüfe Deine Persistent Volume Claims (PVC):** Stelle sicher, dass Deine Persistent Volume Claims nur die tatsächlich benötigten Volumes und Kapazitäten anfordern und verwenden.

#### 5. **Regelmäßige Überprüfung und Monitoring**
   - [ ] **Überprüfe regelmäßig die Zugriffsrechte:** Überwache regelmäßig die Zugriffsrechte auf die eingebundenen Speicherressourcen, um sicherzustellen, dass sie den aktuellen Sicherheitsanforderungen entsprechen.
   - [ ] **Setze Monitoring-Tools ein:** Verwende Monitoring-Tools, um den Zugriff auf eingebundene Speicherressourcen zu überwachen und bei ungewöhnlichen Aktivitäten Alarme auszulösen.
