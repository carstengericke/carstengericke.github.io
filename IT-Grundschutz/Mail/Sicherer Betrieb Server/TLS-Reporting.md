
### TLS-Reporting

TLS-Reporting dient dazu, Transparenz über die Sicherheit der E-Mail-Kommunikation zu gewährleisten, indem Berichte über fehlerhafte oder unsichere TLS-Verbindungen erstellt und an den Domäneninhaber gesendet werden. Dieser Artikel beschreibt, wie man eine E-Mail-Proxylösung mit NGINX und Postfix in Kubernetes einrichtet, um TLS-Reporting in einer Umgebung mit einem HCL Domino-Server zu implementieren.

### Architekturübersicht

- **NGINX** wird als Frontend-Proxy verwendet, um den eingehenden E-Mail-Verkehr zu terminieren und SSL/TLS-Verbindungen zu verwalten.
- **Postfix** fungiert als SMTP-Proxy, der TLS-Reporting unterstützt und den Verkehr an den HCL Domino-Server weiterleitet.
- **HCL Domino** wird als Backend-E-Mail-Server verwendet.

### Schritt 1: Vorbereitung der Container-Images

Du wirst drei Container benötigen:
1. **NGINX**: Für das Proxy-Handling und SSL/TLS-Terminierung.
2. **Postfix**: Für den SMTP-Proxy und TLS-Reporting.
3. **HCL Domino**: Als E-Mail-Server.

### 1.1. **Dockerfile für NGINX**

Erstelle ein Dockerfile für NGINX mit dem Stream-Modul und SSL/TLS-Unterstützung.

```dockerfile
# NGINX Dockerfile
FROM nginx:alpine

RUN apk add --no-cache openssl

COPY nginx.conf /etc/nginx/nginx.conf
COPY ssl/nginx-cert.pem /etc/nginx/ssl/nginx-cert.pem
COPY ssl/nginx-key.pem /etc/nginx/ssl/nginx-key.pem

EXPOSE 25 143 110

CMD ["nginx", "-g", "daemon off;"]
```

### 1.2. **NGINX-Konfiguration**

Erstelle die `nginx.conf` mit den Proxy-Einstellungen.

```nginx
stream {
    log_format basic '$remote_addr [$time_local] $protocol $status $bytes_sent $bytes_received $session_time';
    access_log /var/log/nginx/stream.log basic;

    upstream postfix_smtp {
        server postfix:25;
    }

    upstream postfix_imap {
        server postfix:143;
    }

    upstream postfix_pop3 {
        server postfix:110;
    }

    server {
        listen 25;
        proxy_pass postfix_smtp;
        ssl_preread on;

        # TLS Configuration
        proxy_ssl on;
        proxy_ssl_certificate /etc/nginx/ssl/nginx-cert.pem;
        proxy_ssl_certificate_key /etc/nginx/ssl/nginx-key.pem;
        proxy_ssl_protocols TLSv1.2 TLSv1.3;
        proxy_ssl_ciphers HIGH:!aNULL:!MD5;
    }

    server {
        listen 143;
        proxy_pass postfix_imap;
        ssl_preread on;

        proxy_ssl on;
        proxy_ssl_certificate /etc/nginx/ssl/nginx-cert.pem;
        proxy_ssl_certificate_key /etc/nginx/ssl/nginx-key.pem;
        proxy_ssl_protocols TLSv1.2 TLSv1.3;
        proxy_ssl_ciphers HIGH:!aNULL:!MD5;
    }

    server {
        listen 110;
        proxy_pass postfix_pop3;
        ssl_preread on;

        proxy_ssl on;
        proxy_ssl_certificate /etc/nginx/ssl/nginx-cert.pem;
        proxy_ssl_certificate_key /etc/nginx/ssl/nginx-key.pem;
        proxy_ssl_protocols TLSv1.2 TLSv1.3;
        proxy_ssl_ciphers HIGH:!aNULL:!MD5;
    }
}
```

### 1.3. **Postfix Dockerfile**

Erstelle ein Dockerfile für Postfix.

```dockerfile
# Postfix Dockerfile
FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    postfix \
    && rm -rf /var/lib/apt/lists/*

COPY postfix/main.cf /etc/postfix/main.cf

EXPOSE 25 587

CMD ["postfix", "start-fg"]
```

### 1.4. **Postfix-Konfiguration**

Erstelle die `main.cf` für Postfix.

```plaintext
myhostname = postfix.example.com
relayhost = [domino:25]

# TLS settings
smtp_tls_security_level = may
smtp_tls_loglevel = 1
smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
smtp_tls_protocols = !SSLv2,!SSLv3

# TLS-Reporting
tls_reporting_level = 1
tls_reporting_policy_report = yes
tls_reporting_send_mail_to = tls-report@example.com

# SMTPD settings
smtpd_tls_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
smtpd_tls_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
smtpd_use_tls=yes
smtpd_tls_auth_only = yes
```

### Schritt 2: Kubernetes-Konfiguration

Erstelle Kubernetes-Deployments und Services für die Container.

### 2.1. **NGINX Deployment**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-mail-proxy
  namespace: mail
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-mail-proxy
  template:
    metadata:
      labels:
        app: nginx-mail-proxy
    spec:
      containers:
      - name: nginx
        image: nginx-mail:latest
        ports:
        - containerPort: 25
        - containerPort: 143
        - containerPort: 110
        volumeMounts:
        - name: ssl-certificates
          mountPath: /etc/nginx/ssl
      volumes:
      - name: ssl-certificates
        secret:
          secretName: nginx-ssl-secret
```

### 2.2. **Postfix Deployment**

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postfix
  namespace: mail
spec:
  replicas: 1
  selector:
    matchLabels:
      app: postfix
  template:
    metadata:
      labels:
        app: postfix
    spec:
      containers:
      - name: postfix
        image: postfix-proxy:latest
        ports:
        - containerPort: 25
        - containerPort: 587
```

### 2.3. **HCL Domino Deployment**

Erstelle das HCL Domino Deployment basierend auf einem passenden Domino-Image.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: domino
  namespace: mail
spec:
  replicas: 1
  selector:
    matchLabels:
      app: domino
  template:
    metadata:
      labels:
        app: domino
    spec:
      containers:
      - name: domino
        image: domino-mail:latest
        ports:
        - containerPort: 25
        - containerPort: 143
        - containerPort: 110
```

### Schritt 3: Secrets für SSL/TLS-Zertifikate erstellen

Erstelle ein Kubernetes Secret für die SSL/TLS-Zertifikate, die von NGINX verwendet werden.

```bash
kubectl create secret tls nginx-ssl-secret --cert=/path/to/cert.pem --key=/path/to/key.pem --namespace mail
```

### Schritt 4: Services erstellen

Erstelle Services für die Pods, um den Datenverkehr zu ermöglichen.

### 4.1. **NGINX Service**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-mail-proxy
  namespace: mail
spec:
  selector:
    app: nginx-mail-proxy
  ports:
  - name: smtp
    protocol: TCP
    port: 25
    targetPort: 25
  - name: imap
    protocol: TCP
    port: 143
    targetPort: 143
  - name: pop3
    protocol: TCP
    port: 110
    targetPort: 110
```

### 4.2. **Postfix Service**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: postfix
  namespace: mail
spec:
  selector:
    app: postfix
  ports:
  - name: smtp
    protocol: TCP
    port: 25
    targetPort: 25
  - name: submission
    protocol: TCP
    port: 587
    targetPort: 587
```

### 4.3. **Domino Service**

```yaml
apiVersion: v1
kind: Service
metadata:
  name: domino
  namespace: mail
spec:
  selector:
    app: domino
  ports:
  - name: smtp
    protocol: TCP
    port: 25
    targetPort: 25
  - name: imap
    protocol: TCP
    port: 143
    targetPort: 143
  - name: pop3
    protocol: TCP
    port: 110
    targetPort: 110
```

### Schritt 5: Deployment und Tests

Nachdem alle Ressourcen definiert sind, kannst Du die Kubernetes-Konfigurationsdateien bereitstellen und die Dienste testen.

```bash
kubectl apply -f nginx-deployment.yaml
kubectl apply -f postfix-deployment.yaml
kubectl apply -f domino-deployment.yaml
kubectl apply -f nginx-service.yaml
kubectl apply -f postfix-service.yaml
kubectl apply -f domino-service.yaml
```

Überwache die Logs und teste die E-Mail-Funktionalität,

 um sicherzustellen, dass alles korrekt funktioniert.

### Fazit

Mit dieser Konfiguration hast Du eine vollständige E-Mail-Proxylösung mit NGINX, Postfix und HCL Domino, die in einem Kubernetes-Cluster läuft. NGINX übernimmt die TLS-Terminierung und leitet den Verkehr an Postfix weiter, der wiederum TLS-Reporting ermöglicht und den endgültigen SMTP-Verkehr an den HCL Domino-Server weiterleitet. Diese Lösung bietet eine flexible, sichere und skalierbare E-Mail-Infrastruktur.