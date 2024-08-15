### Falco DaemonSet Deployment für Kubernetes

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: falco
  labels:
    app: falco
spec:
  selector:
    matchLabels:
      app: falco
  template:
    metadata:
      labels:
        app: falco
    spec:
      containers:
      - name: falco
        image: falcosecurity/falco:latest
        securityContext:
          privileged: true
        volumeMounts:
        - mountPath: /host/proc
          name: proc
          readOnly: true
        - mountPath: /host/boot
          name: boot
          readOnly: true
        - mountPath: /host/lib/modules
          name: modules
          readOnly: true
        - mountPath: /host/usr
          name: usr
          readOnly: true
        - mountPath: /host/etc
          name: etc-falco
          readOnly: true
        - mountPath: /var/run/docker.sock
          name: docker-socket
          readOnly: true
        - mountPath: /dev
          name: dev
        env:
        - name: FALCO_LOG_STDOUT
          value: "true"
        - name: FALCO_LOG_STDERR
          value: "true"
        - name: FALCO_PRIORITY_SYSLOG
          value: "debug"
      volumes:
      - name: proc
        hostPath:
          path: /proc
      - name: boot
        hostPath:
          path: /boot
      - name: modules
        hostPath:
          path: /lib/modules
      - name: usr
        hostPath:
          path: /usr
      - name: etc-falco
        hostPath:
          path: /etc/falco
      - name: docker-socket
        hostPath:
          path: /var/run/docker.sock
      - name: dev
        hostPath:
          path: /dev
      hostNetwork: true
      hostPID: true
      tolerations:
      - operator: Exists
      restartPolicy: Always
```

### Erklärung der Komponenten

- **DaemonSet:** Anstelle eines Deployments wird ein DaemonSet verwendet, um sicherzustellen, dass Falco auf jeder Node im Kubernetes-Cluster läuft. Ein DaemonSet sorgt dafür, dass genau ein Pod auf jeder Node des Clusters erstellt wird.

- **privileged: true:** Der Container läuft im `privileged` Modus, was notwendig ist, damit Falco die notwendigen Systemaufrufe und Kernel-Informationen überwachen kann.

- **volumeMounts:** Es gibt verschiedene `volumeMounts`, die sicherstellen, dass Falco Zugriff auf die benötigten Verzeichnisse und Dateien des Host-Systems hat, um effektiv zu funktionieren.

- **hostNetwork und hostPID:** Diese Optionen ermöglichen es dem Falco-Pod, das Netzwerk und die Prozess-Namespaces des Hosts zu verwenden, was für die vollständige Überwachung erforderlich ist.

- **Tolerations:** Diese erlauben dem DaemonSet, auf Nodes mit bestimmten Taints (z.B. Master-Nodes) ausgeführt zu werden.

### Einsatz des DaemonSets

Um dieses DaemonSet in Deinem Kubernetes-Cluster zu deployen, kannst Du das YAML-Manifest in einer Datei speichern und mit `kubectl` anwenden:

```bash
kubectl apply -f falco-daemonset.yaml
```

Dieses Deployment sorgt dafür, dass Falco auf allen Nodes im Cluster läuft und jede Node auf verdächtige Aktivitäten überwacht.