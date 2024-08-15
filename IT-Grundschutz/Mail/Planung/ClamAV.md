### Integration von ClamAV mit HCL Domino in Kubernetes 

Diese Anleitung umfasst die Bereitstellung von ClamAV in einem Kubernetes-Cluster, die Integration mit HCL Domino und die Konfiguration zur Verarbeitung von E-Mails.

### **1. Voraussetzungen**

- Ein laufendes Kubernetes-Cluster.
- Zugriff auf den HCL Domino-Server und dessen Konfiguration.
- Grundlegende Kenntnisse in Kubernetes, YAML und Docker.

### **2. Bereitstellung von ClamAV in Kubernetes**

#### **Schritt 1: Erstelle einen ClamAV-Pod**

Du kannst ClamAV in einem Kubernetes-Pod bereitstellen, indem Du ein Deployment erstellst. Hier ist ein Beispiel für eine `clamav-deployment.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: clamav
  labels:
    app: clamav
spec:
  replicas: 1
  selector:
    matchLabels:
      app: clamav
  template:
    metadata:
      labels:
        app: clamav
    spec:
      containers:
      - name: clamav
        image: mkodockx/docker-clamav:alpine
        ports:
        - containerPort: 3310
        livenessProbe:
          httpGet:
            path: /status
            port: 3310
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /status
            port: 3310
          initialDelaySeconds: 30
          periodSeconds: 10
```

#### **Schritt 2: Bereitstellen des ClamAV-Deployments**

Deploye ClamAV mit dem folgenden Befehl:

```bash
kubectl apply -f clamav-deployment.yaml
```

Dies erstellt einen ClamAV-Pod, der als Virenscanner für eingehende und ausgehende E-Mails dient.

#### **Schritt 3: Erstelle einen Service für ClamAV**

Damit der HCL Domino-Server auf ClamAV zugreifen kann, erstelle einen Kubernetes-Service:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: clamav-service
spec:
  selector:
    app: clamav
  ports:
    - protocol: TCP
      port: 3310
      targetPort: 3310
```

Deploye den Service mit:

```bash
kubectl apply -f clamav-service.yaml
```

### **3. Integration mit HCL Domino**

#### **Schritt 1: Verbinde HCL Domino mit ClamAV**

Um E-Mails, die HCL Domino passieren, auf Viren zu scannen, musst Du eine Verbindung zwischen dem Domino-Server und ClamAV herstellen.

- **SMTP Relay mit Amavis (Option 1):**  
  Nutze Amavis als SMTP-Relay zwischen HCL Domino und ClamAV.

  - Installiere Amavis in einem eigenen Pod oder als Sidecar-Container in Deinem Domino-Pod.
  - Konfiguriere Amavis so, dass es ClamAV über den Kubernetes-Service (`clamav-service`) anspricht.
  - Passe die SMTP-Konfiguration von HCL Domino an, damit sie E-Mails über Amavis leitet.

- **Direkte Integration mit ClamAV (Option 2):**
  Wenn Du Amavis nicht verwenden möchtest, kannst Du direkt einen Mail-Filter auf HCL Domino konfigurieren, um ClamAV über den Kubernetes-Service zu kontaktieren.

#### **Schritt 2: Konfiguriere Amavis für die Nutzung mit ClamAV**

Erstelle eine Konfigurationsdatei für Amavis, um den ClamAV-Service in Kubernetes zu nutzen. Beispiel für eine `50-user` Datei:

```perl
@av_scanners = (
  ['ClamAV-clamd',
    \&ask_daemon, ["CONTSCAN {}\n", "clamav-service:3310"],
    qr/\bOK$/, qr/\bFOUND$/,
    qr/^.*?: (?!Infected Archive)(.*) FOUND$/ ],
);
```

Deploye die Konfiguration und stelle sicher, dass Amavis die E-Mails an ClamAV sendet.

### **4. Testen der Integration**

1. **Test-Mail senden:**  
   - Sende eine Test-E-Mail mit einem bekannten Virus (z.B. die EICAR-Testdatei) an eine Adresse, die über den HCL Domino-Server läuft.
   - Überprüfe, ob ClamAV den Virus erkennt und entsprechend blockiert.

2. **Protokolle prüfen:**  
   - Überprüfe die Protokolle von ClamAV, Amavis und HCL Domino, um sicherzustellen, dass der E-Mail-Scan ordnungsgemäß funktioniert.

   ```bash
   kubectl logs deployment/clamav
   kubectl logs deployment/your-amavis-deployment
   ```

### **5. Überwachung und Wartung**

- **Automatische Updates:**  
  Stelle sicher, dass die Virendatenbank von ClamAV regelmäßig aktualisiert wird. Du kannst dafür `freshclam` in einem CronJob in Kubernetes konfigurieren.

- **Monitoring:**  
  Überwache die Pods und Services regelmäßig, um sicherzustellen, dass der E-Mail-Scan kontinuierlich funktioniert.

- **Skalierung:**  
  Passe die Anzahl der ClamAV-Pods nach Bedarf an, um die Last zu verteilen und die Verfügbarkeit zu erhöhen.

### **Zusammenfassung**

Durch die Bereitstellung von ClamAV in einem Kubernetes-Cluster und die Integration mit HCL Domino kannst Du sicherstellen, dass alle ein- und ausgehenden E-Mails auf Viren und Malware gescannt werden. Diese Anleitung zeigt, wie Du ClamAV als Container bereitstellst, es in Kubernetes betreibst und es mit HCL Domino integrierst, entweder direkt oder über einen SMTP-Relay-Dienst wie Amavis.