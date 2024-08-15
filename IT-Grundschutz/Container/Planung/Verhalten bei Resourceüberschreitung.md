In Kubernetes gibt es verschiedene Mechanismen zur Begrenzung und Verwaltung von Ressourcen wie CPU, RAM, Speicher und Netzwerk für Container. Diese Mechanismen sollen sicherstellen, dass keine einzelnen Pods oder Container mehr Ressourcen verbrauchen, als ihnen zugewiesen wurden, und dass die Stabilität des gesamten Clusters gewährleistet ist. Wenn diese Ressourcen überschritten werden und keine Skalierung möglich ist, verhält sich Kubernetes wie folgt:

### 1. **CPU-Limits**
   - **Verhalten bei Überschreitung:**
     - **Throttle (Drosselung):** Wenn ein Container das ihm zugewiesene CPU-Limit überschreitet, wird er gedrosselt. Das bedeutet, dass Kubernetes die CPU-Zyklen, die diesem Container zugewiesen werden, reduziert. Der Container bleibt weiterhin funktionsfähig, arbeitet jedoch langsamer.
     - **Keine Beendigung:** Container werden nicht beendet, wenn sie CPU-Limits überschreiten; sie arbeiten nur langsamer.

### 2. **RAM-Limits**
   - **Verhalten bei Überschreitung:**
     - **OOM-Killer (Out Of Memory-Killer):** Wenn ein Container mehr RAM verbraucht als ihm zugewiesen wurde, wird der Prozess innerhalb des Containers vom OOM-Killer (Teil des Linux-Kernels) beendet. Der Container selbst wird möglicherweise neu gestartet, abhängig von den definierten Restart-Policies.
     - **Beendigung und Neustart:** Kubernetes beendet den Container, wenn er sein RAM-Limit überschreitet und keine zusätzlichen Ressourcen verfügbar sind. Anschließend versucht Kubernetes, den Container gemäß der angegebenen Restart-Policy neu zu starten.

### 3. **Speicher-Limits (Persistent Storage)**
   - **Verhalten bei Überschreitung:**
     - **Schreibfehler:** Wenn ein Container versucht, mehr Speicherplatz zu verwenden, als ihm durch Persistent Volume Claims (PVC) zugewiesen wurde, schlägt der Schreibvorgang fehl. Der Container kann möglicherweise weiterlaufen, aber ohne die Fähigkeit, zusätzliche Daten zu speichern.
     - **Kein automatischer Neustart:** Kubernetes beendet den Container nicht automatisch, wenn das Speicherlimit erreicht wird, aber die Anwendung im Container kann möglicherweise Fehler protokollieren oder in einen fehlerhaften Zustand geraten.

### 4. **Netzwerk-Limits**
   - **Verhalten bei Überschreitung:**
     - **Netzwerk-Plugins:** Kubernetes selbst begrenzt standardmäßig keine Netzwerkauslastung. Jedoch können Netzwerk-Plugins oder externe QoS-Systeme (Quality of Service) verwendet werden, um Netzwerk-Ressourcen zu kontrollieren. Bei einer Überschreitung dieser Limits könnte es zu Paketverlusten, erhöhter Latenz oder Netzwerkdrosselung kommen.
     - **Netzwerkengpässe:** Ohne entsprechende QoS-Regelungen kann eine hohe Netzwerkauslastung durch einen Pod zu Engpässen führen, die sich auf andere Pods im Cluster auswirken.

### 5. **Keine Skalierung möglich (keine zusätzlichen Ressourcen verfügbar)**
   - **Verhalten bei CPU- und RAM-Überschreitung:**
     - **Verlangsamung und potenzielle Instabilität:** Wenn Pods ihre Ressourcenlimits erreichen und keine zusätzlichen Ressourcen im Cluster verfügbar sind, kann es zu einer Verlangsamung oder Instabilität der betroffenen Anwendungen kommen.
     - **Pods im Pending-Zustand:** Wenn neue Pods geplant werden, aber keine ausreichenden Ressourcen verfügbar sind, bleiben diese im "Pending"-Zustand, bis genügend Ressourcen freigegeben werden.
     - **Fehlerzustände:** Anwendungen können Fehler aufweisen, wenn sie versuchen, Operationen durchzuführen, für die nicht genügend Ressourcen vorhanden sind.

### 6. **Quality of Service (QoS)**
   - Kubernetes klassifiziert Pods in verschiedene QoS-Klassen (Guaranteed, Burstable, BestEffort) basierend auf den konfigurierten Ressourcenanforderungen und -limits. Diese Klassen bestimmen, wie Kubernetes Ressourcenprioritäten behandelt:
     - **Guaranteed:** Diese Pods erhalten die höchsten Ressourcenprioritäten und werden am wenigsten wahrscheinlich vom OOM-Killer beendet.
     - **Burstable:** Diese Pods haben bestimmte Ressourcen zugewiesen, können jedoch bei Bedarf über diese Limits hinausgehen, wenn Ressourcen verfügbar sind.
     - **BestEffort:** Diese Pods haben keine garantierten Ressourcenanforderungen und sind am meisten gefährdet, vom OOM-Killer beendet zu werden.

### Zusammenfassung:

Wenn ein Container oder Pod in Kubernetes seine zugewiesenen Ressourcen überschreitet und keine Skalierung möglich ist, kann es zu einer Drosselung (bei CPU), Beendigung durch den OOM-Killer (bei RAM), Fehlern bei Speicheroperationen (bei Speicher) oder Netzwerkdrosselung kommen. Kubernetes versucht, die Auswirkungen auf das Gesamtsystem zu minimieren, aber eine sorgfältige Planung und Überwachung der Ressourcennutzung ist notwendig, um die Stabilität und Performance sicherzustellen.