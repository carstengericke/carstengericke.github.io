Um Fluent Bit für einen `nginx-modsecurity` Pod zu konfigurieren, musst Du sicherstellen, dass Fluent Bit in der Lage ist, die Logs von NGINX und ModSecurity zu sammeln und sie an den gewünschten Log-Server weiterzuleiten. Hier ist eine detaillierte Anleitung, wie Du Fluent Bit in Kubernetes für diesen Anwendungsfall einrichtest:

### **1. Fluent Bit als DaemonSet in Kubernetes installieren**

Wenn Du Fluent Bit noch nicht als DaemonSet in Deinem Kubernetes-Cluster installiert hast, musst Du dies zuerst tun. Hier ist ein einfaches Beispiel für ein DaemonSet:

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: fluent-bit
  namespace: kube-system
  labels:
    k8s-app: fluent-bit
spec:
  selector:
    matchLabels:
      k8s-app: fluent-bit
  template:
    metadata:
      labels:
        k8s-app: fluent-bit
    spec:
      containers:
      - name: fluent-bit
        image: fluent/fluent-bit:1.8
        ports:
        - containerPort: 24224
          name: fluentd
        volumeMounts:
        - name: varlog
          mountPath: /var/log
        - name: varlibdockercontainers
          mountPath: /var/lib/docker/containers
          readOnly: true
        - name: config-volume
          mountPath: /fluent-bit/etc
      volumes:
      - name: varlog
        hostPath:
          path: /var/log
      - name: varlibdockercontainers
        hostPath:
          path: /var/lib/docker/containers
      - name: config-volume
        configMap:
          name: fluent-bit-config
      serviceAccountName: fluent-bit
```

### **2. Fluent Bit Konfiguration für NGINX und ModSecurity Logs**

Du musst Fluent Bit so konfigurieren, dass es sowohl die NGINX-Logs als auch die ModSecurity-Logs sammelt. Dies erfolgt durch eine ConfigMap, die die Konfiguration von Fluent Bit enthält.

**Erstelle eine ConfigMap für Fluent Bit:**

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: fluent-bit-config
  namespace: kube-system
data:
  fluent-bit.conf: |
    [SERVICE]
        Flush        1
        Log_Level    info
        Parsers_File parsers.conf

    [INPUT]
        Name              tail
        Path              /var/log/containers/nginx-*.log
        Path_Key          filename
        Tag               nginx.*
        Parser            json
        DB                /var/log/flb_nginx.db
        Mem_Buf_Limit     5MB
        Skip_Long_Lines   On
        Refresh_Interval  5

    [INPUT]
        Name              tail
        Path              /var/log/containers/modsecurity-*.log
        Path_Key          filename
        Tag               modsecurity.*
        Parser            json
        DB                /var/log/flb_modsecurity.db
        Mem_Buf_Limit     5MB
        Skip_Long_Lines   On
        Refresh_Interval  5

    [FILTER]
        Name                kubernetes
        Match               nginx.* modsecurity.*
        Kube_Tag_Prefix     kube.var.log.containers.
        Kube_URL            https://kubernetes.default.svc:443
        Kube_CA_File        /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
        Kube_Token_File     /var/run/secrets/kubernetes.io/serviceaccount/token
        Merge_Log           On
        Keep_Log            Off
        Merge_Log_Trim      On
        Annotations         Off

    [OUTPUT]
        Name          forward
        Match         nginx.* modsecurity.*
        Host          <LOGFILE_SERVER_IP>
        Port          24224

  parsers.conf: |
    [PARSER]
        Name        json
        Format      json
        Time_Key    time
        Time_Format %Y-%m-%dT%H:%M:%S.%L
        Time_Keep   On
        Decode_Field_As escaped_utf8 log
```

### **3. Erläuterung der Konfiguration**

- **[INPUT]**: Fluent Bit ist so konfiguriert, dass es die Logs von NGINX und ModSecurity sammelt, die typischerweise in `/var/log/containers/` gespeichert sind. Es verwendet zwei `INPUT`-Blöcke:
  - Der erste `INPUT`-Block sammelt die NGINX-Logs.
  - Der zweite `INPUT`-Block sammelt die ModSecurity-Logs.
  
- **[FILTER]**: Hier wird ein Kubernetes-Filter verwendet, um die Logs mit zusätzlichen Metadaten wie dem Pod-Namen, Namespace, etc. anzureichern. Dies ist besonders nützlich, wenn die Logs an einen zentralen Log-Server gesendet werden sollen, um diese Informationen zur Verfügung zu haben.

- **[OUTPUT]**: Die gesammelten Logs werden dann an einen externen Logfile-Server weitergeleitet, der unter der IP-Adresse `<LOGFILE_SERVER_IP>` und dem Port `24224` konfiguriert ist.

- **Parsers Configuration**: Ein einfacher JSON-Parser wird verwendet, um sicherzustellen, dass die Logs korrekt interpretiert werden.

### **4. Deployment von Fluent Bit in Kubernetes**

Nachdem Du die ConfigMap und das DaemonSet erstellt hast, kannst Du die Konfiguration in Deinem Kubernetes-Cluster bereitstellen:

```bash
kubectl apply -f fluent-bit-configmap.yaml
kubectl apply -f fluent-bit-daemonset.yaml
```

### **5. Überprüfung der Logs**

Nachdem Fluent Bit konfiguriert und bereitgestellt wurde, solltest Du überprüfen, ob die Logs von NGINX und ModSecurity ordnungsgemäß an den Logfile-Server gesendet werden:

- **Überprüfe die Fluent Bit Logs**: Du kannst die Logs des Fluent Bit Pods überprüfen, um sicherzustellen, dass die Logs korrekt gesammelt und weitergeleitet werden:

  ```bash
  kubectl logs -n kube-system daemonset/fluent-bit
  ```

- **Überprüfe den Logfile-Server**: Überprüfe, ob die Logs erfolgreich auf dem Logfile-Server gespeichert werden.

### **Zusammenfassung**

Mit dieser Konfiguration von Fluent Bit kannst Du die Logs Deines `nginx-modsecurity` Pods in Kubernetes erfassen und an einen externen Logfile-Server weiterleiten. Fluent Bit ist leichtgewichtig, effizient und speziell für den Einsatz in Kubernetes-Umgebungen optimiert, was es zur idealen Lösung für das Sammeln und Weiterleiten von Logs macht.