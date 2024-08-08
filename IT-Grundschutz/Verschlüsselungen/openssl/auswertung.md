Das Skript testet verschiedene Cipher Suites, indem es versucht, eine Verbindung zu einem Server (in diesem Fall `domino.inlakech.de` auf Port 443) herzustellen und zu prüfen, welche Cipher Suites der Server akzeptiert. Die Ausgabe zeigt an, welche Cipher Suites erfolgreich verwendet werden konnten und welche nicht.

### **Interpretation der Ergebnisse:**

- **TLS_AES_256_GCM_SHA384 : New, (NONE), Cipher is (NONE)**  
  Dies bedeutet, dass der Versuch, diese Cipher Suite zu verwenden, fehlgeschlagen ist. Der Server unterstützt diese Cipher Suite nicht.

- **ECDHE-RSA-AES256-GCM-SHA384 : New, TLSv1.2, Cipher is ECDHE-RSA-AES256-GCM-SHA384**  
  Hier hat der Server die Verbindung erfolgreich aufgebaut und die Cipher Suite `ECDHE-RSA-AES256-GCM-SHA384` verwendet. Das bedeutet, dass der Server diese Cipher Suite unterstützt.

- **DHE-RSA-AES256-GCM-SHA384 : New, TLSv1.2, Cipher is DHE-RSA-AES256-GCM-SHA384**  
  Auch hier konnte die Verbindung erfolgreich hergestellt werden, und die Cipher Suite `DHE-RSA-AES256-GCM-SHA384` wurde verwendet.

- **ECDHE-RSA-AES128-GCM-SHA256 : New, TLSv1.2, Cipher is ECDHE-RSA-AES128-GCM-SHA256**  
  Diese Cipher Suite wurde ebenfalls erfolgreich unterstützt.

- **DHE-RSA-AES128-GCM-SHA256 : New, TLSv1.2, Cipher is DHE-RSA-AES128-GCM-SHA256**  
  Auch hier war die Verbindung erfolgreich und diese Cipher Suite wurde unterstützt.

- **Andere Cipher Suites, wie z.B. ECDHE-ECDSA-AES256-GCM-SHA384, ECDHE-ECDSA-CHACHA20-POLY1305, etc.: New, (NONE), Cipher is (NONE)**  
  Diese Cipher Suites wurden nicht unterstützt. Das bedeutet, dass der Server entweder die Algorithmen oder Parameter dieser Cipher Suites nicht akzeptiert oder dass die Konfiguration des Servers diese Cipher Suites nicht zulässt.

### **Schlussfolgerungen:**

- **Unterstützte Cipher Suites:** Der Server unterstützt die Cipher Suites, die auf TLSv1.2 basieren und RSA zur Authentifizierung sowie ECDHE oder DHE für den Schlüsselaustausch verwenden. Insbesondere die AES-GCM Cipher Suites mit 128- und 256-Bit-Schlüsseln wurden unterstützt.

- **Nicht unterstützte Cipher Suites:** Cipher Suites, die andere Authentifizierungsmechanismen verwenden (wie ECDSA), oder die modernere Algorithmen wie CHACHA20-POLY1305 verwenden, wurden nicht akzeptiert.

Das Ergebnis zeigt, dass der Server eine Auswahl sicherer und moderner Cipher Suites unterstützt, aber nicht die allerneuesten oder spezifischeren Varianten, wie sie z.B. in TLS 1.3 vorkommen. Dies könnte an der Konfiguration des Servers oder der verwendeten TLS-Bibliothek liegen.

---

Wenn in deinem Skript die Ausgabe `Cipher is (NONE)` erscheint, bedeutet das, dass der Server die angegebene Cipher Suite nicht akzeptiert hat.

### Was passiert dabei im Detail?

1. **Cipher Suite wird angeboten:** Dein Client (durch das `openssl s_client` Kommando) versucht, eine Verbindung mit der angegebenen Cipher Suite zum Server herzustellen.

2. **Server lehnt ab:** Der Server prüft, ob er diese Cipher Suite unterstützt. Wenn er die Cipher Suite **nicht unterstützt** oder sie aus anderen Gründen (z.B. Sicherheitsrichtlinien) ablehnt, kommt es zu einem **Handshake-Fehler**.

3. **Keine erfolgreiche Aushandlung:** Da keine Cipher Suite ausgehandelt werden konnte, die beide Seiten unterstützen, wird die Verbindung abgelehnt. Dies führt dazu, dass der ausgehandelte Cipher (die tatsächlich verwendete Cipher Suite) `NONE` ist, was bedeutet, dass keine gültige Cipher Suite für die Verbindung ausgehandelt werden konnte.

4. **Ausgabe `Cipher is (NONE)`:** Das Ergebnis des fehlgeschlagenen Versuchs wird als `Cipher is (NONE)` angezeigt, was anzeigt, dass keine Verschlüsselung für die Verbindung zustande kam, weil die vorgeschlagene Cipher Suite abgelehnt wurde.

### Fazit:

Wenn `Cipher is (NONE)` angezeigt wird, hat der Server die vorgeschlagene Cipher Suite getestet, sie jedoch zurückgewiesen. Dies kann daran liegen, dass der Server diese Cipher Suite nicht unterstützt, sie als unsicher eingestuft wird, oder dass sie einfach nicht in der Serverkonfiguration zugelassen ist.