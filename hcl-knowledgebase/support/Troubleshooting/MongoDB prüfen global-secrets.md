## Anleitung: Verbindung zu MongoDB aus Kubernetes testen und HCL Sametime Datenbanken überprüfen

### Ziel:
Diese Anleitung hilft dir dabei zu überprüfen, ob du dich erfolgreich von einem Kubernetes-Cluster mit einer MongoDB-Instanz verbinden kannst und ob die für HCL Sametime erforderlichen Datenbanken vorhanden sind.

### Schritte:

#### 1. Abrufen der MongoDB-Verbindungs-URL

1. **Hole die MongoDB-Verbindungs-URL aus dem Kubernetes Secret**:

   Verwende den folgenden Befehl, um die MongoDB-Verbindungs-URL, die in einem Kubernetes Secret gespeichert ist, zu entschlüsseln:

   ```bash
   kubectl get secret sametime-global-secrets -o jsonpath="{.data.MongoConnectionUrl}" | base64 --decode
   ```

   Dieser Befehl dekodiert die im Secret `sametime-global-secrets` gespeicherte MongoDB-Verbindungs-URL und gibt sie im Klartext aus. Diese URL wird später für das Deployment verwendet.

#### 2. Erstellen des Kubernetes Deployments

1. **Erstelle eine YAML-Datei** für das Deployment, z. B. `mongodb-client.yaml`:

   ```yaml
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: mongodb-client
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: mongodb-client
     template:
       metadata:
         labels:
           app: mongodb-client
       spec:
         containers:
         - name: mongodb-client
           image: mongo:6
           command: ["sleep", "3600"] # Dieser Pod bleibt einfach am Laufen, sodass du ihn betreten kannst
           env:
           - name: MONGODB_URI
             value: "mongodb+srv://sametimeAdmin:secret@mongodbhostname.ionos.com"
   ```

   **Hinweis:** Ersetze `<credentials>` in der URL durch die tatsächlichen Anmeldeinformationen (`sametimeAdmin:secret`) und den Hostnamen `mongodbhostname.ionos.com` durch den tatsächlichen Hostnamen deiner MongoDB-Instanz.

2. **Deploy die YAML-Datei in deinem Kubernetes-Cluster**:

   Führe den folgenden Befehl aus, um das Deployment in Kubernetes zu erstellen:

   ```bash
   kubectl apply -f mongodb-client.yaml
   ```

   Dieser Befehl erstellt einen Pod, der mit dem MongoDB-Client-Image in Version 6 arbeitet.

#### 3. Verbindung zur MongoDB herstellen

1. **Überprüfe, ob der Pod läuft**:

   Führe den folgenden Befehl aus, um die laufenden Pods in deinem Cluster zu sehen:

   ```bash
   kubectl get pods
   ```

   Suche den Pod mit dem Namen `mongodb-client-<random-string>`. Der Pod sollte im Status `Running` sein.

2. **Öffne eine interaktive Shell im Pod**:

   Betritt den Pod, indem du den folgenden Befehl ausführst:

   ```bash
   kubectl exec -it <pod-name> -- /bin/bash
   ```

   **Hinweis:** Ersetze `<pod-name>` durch den tatsächlichen Namen des Pods, den du im vorherigen Schritt gefunden hast.

3. **Stelle eine Verbindung zur MongoDB-Instanz her**:

   Innerhalb der Shell im Pod führe den MongoDB-Client (`mongosh`) mit der zuvor gesetzten Umgebungsvariablen aus:

   ```bash
   mongosh $MONGODB_URI
   ```

   Wenn die Verbindung erfolgreich ist, wirst du in die MongoDB-Shell (`mongosh`) eingeloggt.

#### 4. Überprüfen der HCL Sametime Datenbanken

1. **Zeige alle verfügbaren Datenbanken an**:

   Sobald du in der MongoDB-Shell bist, kannst du die Liste der verfügbaren Datenbanken anzeigen, indem du den folgenden Befehl eingibst:

   ```bash
   show dbs
   ```

   Die Ausgabe dieses Befehls wird alle Datenbanken auflisten, die auf dem verbundenen MongoDB-Server vorhanden sind.

2. **Überprüfe die Liste der Datenbanken**:

   Stelle sicher, dass die für HCL Sametime erforderlichen Datenbanken vorhanden sind. Diese könnten unter anderem folgende Namen haben:
   - `chatlogging`
   - `meeting`
   - `privacy`
   - `userinfo`

   Wenn diese Datenbanken vorhanden sind, zeigt dies, dass die Verbindung zur MongoDB-Instanz erfolgreich hergestellt wurde und die HCL Sametime-Datenbanken existieren.

#### 5. Pod beenden und löschen

1. **Lösche das Deployment**:

   Um den Pod zu stoppen und das Deployment zu löschen, führe den folgenden Befehl aus:

   ```bash
   kubectl delete -f mongodb-client.yaml
   ```

   Dieser Befehl entfernt das Deployment und den zugehörigen Pod aus deinem Kubernetes-Cluster.

2. **Überprüfe, ob der Pod gelöscht wurde**:

   Führe den folgenden Befehl aus, um sicherzustellen, dass der Pod nicht mehr existiert:

   ```bash
   kubectl get pods
   ```

   Der Pod sollte nicht mehr in der Liste der laufenden Pods erscheinen.

### Zusammenfassung

Mit dieser Anleitung hast du:

- Ein Kubernetes Deployment erstellt, das einen Pod mit dem MongoDB-Client Version 6 startet.
- Dich über den Pod erfolgreich mit der MongoDB-Instanz verbunden und die Liste der verfügbaren Datenbanken abgerufen.
- Die Existenz der für HCL Sametime erforderlichen Datenbanken überprüft.
- Den Pod und das Deployment nach dem Test ordnungsgemäß gelöscht, um Ressourcen freizugeben.

