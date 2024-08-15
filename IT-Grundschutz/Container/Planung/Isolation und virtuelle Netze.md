
### **Sicherer Einsatz containerisierter IT-Systeme**

#### **1. Schutzbedarf der Anwendungen**
- **Was ist der Schutzbedarf?** Der Schutzbedarf einer Anwendung beschreibt, wie kritisch die Anwendung ist und welche Sicherheitsanforderungen sie hat. Dies umfasst Aspekte wie Vertraulichkeit, Integrität und Verfügbarkeit der Daten und Dienste, die von der Anwendung verarbeitet oder bereitgestellt werden.
- **Warum ist das wichtig?** Unterschiedliche Anwendungen haben unterschiedliche Schutzbedarfe. Eine Anwendung, die sensible Daten verarbeitet (z.B. persönliche Daten, Finanzdaten), hat einen höheren Schutzbedarf als eine Anwendung, die öffentlich zugängliche Informationen bereitstellt.

#### **2. Isolation und Kapselung**
- **Was bedeutet Isolation und Kapselung?** 
  - **Isolation** bezieht sich darauf, wie gut die einzelnen Container und Anwendungen voneinander getrennt sind, um sicherzustellen, dass ein Sicherheitsvorfall in einem Container keine Auswirkungen auf andere Container oder das Host-System hat.
  - **Kapselung** bedeutet, dass jede Anwendung in ihrer eigenen Umgebung läuft, unabhängig von anderen Anwendungen, wodurch Risiken minimiert werden, die durch gemeinsame Ressourcen entstehen könnten.
- **Warum ist das wichtig?** In einer Umgebung, in der mehrere Container auf demselben Host laufen, ist es wichtig sicherzustellen, dass ein kompromittierter Container keine anderen Container oder das Host-System gefährdet. Starke Isolation und Kapselung verhindern seitliche Bewegungen von Angriffen und schützen vor Angriffen auf gemeinsam genutzte Ressourcen.

#### **3. Virtuelle Netze**
- **Was bedeutet virtuelle Netze?** In Kubernetes und anderen Container-Orchestrierungssystemen werden virtuelle Netzwerke verwendet, um Container miteinander und mit der Außenwelt zu verbinden. Diese virtuellen Netzwerke sind oft softwaredefiniert und bieten Mechanismen zur Netzwerksegmentierung, Firewalls und anderen Sicherheitsfunktionen.
- **Warum ist das wichtig?** Die Sicherheit der virtuellen Netzwerke ist entscheidend, um sicherzustellen, dass nur autorisierte Verbindungen zwischen Containern und zwischen Containern und externen Systemen hergestellt werden. Unsichere oder schlecht konfigurierte virtuelle Netzwerke können Angreifern ermöglichen, sich innerhalb des Systems zu bewegen oder unbefugten Zugriff zu erlangen.

#### **4. Prüfung der Anforderungen**
- **Was bedeutet die Prüfung der Anforderungen?** 
  - Diese Prüfung beinhaltet eine Bewertung, ob die technischen und organisatorischen Maßnahmen, die zur Isolation, Kapselung und zum Schutz der virtuellen Netze implementiert wurden, ausreichen, um den Schutzbedarf der Anwendungen zu erfüllen.
  - Es muss geprüft werden, ob die vorhandene Infrastruktur und Sicherheitsmaßnahmen den spezifischen Anforderungen gerecht werden, die sich aus dem Schutzbedarf der jeweiligen Anwendungen ergeben.
  
#### **Zusammenfassung der Anforderung**

Die Anforderung verlangt, dass vor dem Einsatz containerisierter IT-Systeme eine gründliche Prüfung durchgeführt wird, um sicherzustellen, dass die Container ausreichend isoliert und gekapselt sind und dass die virtuellen Netzwerke sicher konfiguriert sind. Diese Maßnahmen müssen den spezifischen Schutzbedarf der betriebenen Anwendungen berücksichtigen, damit Sicherheitsanforderungen wie Vertraulichkeit, Integrität und Verfügbarkeit effektiv gewährleistet werden können.

Die Zielsetzung dieser Anforderung ist es, sicherzustellen, dass containerisierte Anwendungen in einer sicheren Umgebung betrieben werden, die den spezifischen Sicherheitsbedürfnissen dieser Anwendungen gerecht wird. Dies ist besonders wichtig in Szenarien, in denen Anwendungen unterschiedliche Schutzbedarfe haben oder in denen sensible Daten verarbeitet werden.