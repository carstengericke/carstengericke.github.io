
Sametime nutzt Jitsi als Video/Meeting Platform.

Die benötigte Bandbreite für Jitsi bei 100 Benutzern hängt von verschiedenen Faktoren ab, einschließlich der Art der Videokonferenz (einzelne oder mehrere gleichzeitige Streams), der Videoqualität, und ob es sich um ein einseitiges oder bidirektionales Videostreaming handelt.

### Grundlegende Annahmen zur Bandbreite:
1. **Videoqualität**: Standardmäßig kann Jitsi für verschiedene Videoauflösungen konfiguriert werden. Hier sind einige Beispiele:
   - **HD (720p)**: Etwa 2-3 Mbit/s pro Stream.
   - **SD (480p)**: Etwa 0,5-1 Mbit/s pro Stream.
   - **Audio**: Normalerweise benötigt dies etwa 50-100 Kbit/s.

2. **Teilnehmeranzahl**: Bei 100 Teilnehmern können die Bandbreitenanforderungen stark variieren, je nachdem, wie viele Teilnehmer gleichzeitig Videos streamen.

### Szenarien:

1. **Alle 100 Benutzer streamen Videos in 720p**:
   - **Upstream (Upload)**: Jitsi arbeitet in der Regel so, dass jeder Benutzer sein eigenes Video an den Server sendet, welcher es dann an alle anderen weiterleitet. Wenn jeder Benutzer in 720p streamt, benötigen wir etwa 2-3 Mbit/s pro Benutzer.
   - **Downstream (Download)**: Jeder Benutzer empfängt potenziell bis zu 99 Videos von anderen Benutzern. Aber Jitsi verwendet selektives Forwarding, um Bandbreite zu sparen, was bedeutet, dass Benutzer nur die Streams erhalten, die sie tatsächlich sehen (z.B. wenn sie die Galerieansicht verwenden).

   **Gesamtanforderung:**
   - **Upstream pro Benutzer**: 2-3 Mbit/s × 100 Benutzer = 200-300 Mbit/s (gesamt)
   - **Downstream pro Benutzer**: Bei voller Auslastung könnte ein Benutzer theoretisch bis zu 99 andere Streams empfangen, was bedeutet: 2-3 Mbit/s × 99 = 198-297 Mbit/s (pro Benutzer).

2. **Nur 10 von 100 Benutzern streamen Video, der Rest empfängt nur**:
   - **Upstream pro aktiven Benutzer**: 2-3 Mbit/s × 10 Benutzer = 20-30 Mbit/s (gesamt)
   - **Downstream pro passiven Benutzer**: 2-3 Mbit/s × 10 = 20-30 Mbit/s (pro Benutzer, der alle Videos empfängt).

### Realistische Annahme:
In der Praxis streamen normalerweise nicht alle Benutzer gleichzeitig in hoher Auflösung. Ein realistisches Szenario könnte daher so aussehen:
- **30 Benutzer streamen in SD (480p)**
  - **Upstream pro Benutzer**: 0,5-1 Mbit/s × 30 Benutzer = 15-30 Mbit/s (gesamt)
  - **Downstream pro Benutzer**: 0,5-1 Mbit/s × 29 = 14,5-29 Mbit/s (pro Benutzer)

### Gesamtbandbreitenanforderung:
Unter der Annahme, dass etwa 30 Benutzer gleichzeitig in SD streamen und der Rest nur zuhört oder zusieht, könnten die Gesamtbandbreitenanforderungen für 100 Benutzer bei etwa 15-30 Mbit/s (Upstream) und 15-30 Mbit/s (Downstream) pro Benutzer liegen.

Die Gesamtbandbreite für den Server kann jedoch deutlich höher sein, insbesondere wenn viele Benutzer gleichzeitig streamen. In einem Worst-Case-Szenario könnte die Bandbreitenanforderung für den Server im Gbit-Bereich liegen, wenn eine große Anzahl von Teilnehmern Videos in hoher Auflösung streamt.

### Fazit:
Für 100 Benutzer bei Jitsi, insbesondere wenn einige von ihnen in hoher Auflösung streamen, sollten mehrere hundert Mbit/s bis hin zu 1 Gbit/s (gesamt) für den Server in Betracht gezogen werden, um eine qualitativ hochwertige Erfahrung zu gewährleisten. Für jeden Teilnehmer könnte die individuelle Bandbreitenanforderung je nach Szenario zwischen 2-30 Mbit/s (Downstream/Upstream) schwanken.