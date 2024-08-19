
| **Befehl**                                                                                           | **Beschreibung**                                                                                     |
|-------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| **Ressourcen anzeigen**                                                                               |                                                                                                       |
| `kubectl get services`                                                                                | Listet alle Services im aktuellen Namespace auf.                                                      |
| `kubectl get po --watch`                                                                              | Überwacht die Pods im aktuellen Namespace und zeigt Echtzeit-Updates über deren Status an.            |
| **Helm Charts anzeigen**                                                                              |                                                                                                       |
| `helm show values sametime-premium-single-node-12.0.2.tgz`                                            | Zeigt die standardmäßigen Werte eines Helm-Charts an.                                                 |
| **Helm Charts installieren**                                                                          |                                                                                                       |
| `helm install sametime sametime-premium-single-node-12.0.2.tgz -f customValues.yaml`                  | Installiert das Sametime-Helm-Chart mit den in `customValues.yaml` definierten Werten.                |
| **Helm Charts upgraden**                                                                              |                                                                                                       |
| `helm upgrade sametime sametime-premium-single-node-12.0.2.tgz -f customValues.yaml`                  | Aktualisiert eine bestehende Sametime-Installation mit neuen Werten aus dem Helm-Chart.               |
| **Helm Charts deinstallieren**                                                                        |                                                                                                       |
| `helm uninstall sametime`                                                                             | Deinstalliert eine Helm-Release mit dem Namen `sametime`.                                             |

