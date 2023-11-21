
Damit die ilink CRM Extensions auf die Kontakte im Hubspot zugreifen können, benötiget Du ein Zugriffstoken.

Schritt 1: Erstelle eine private App in HubSpot
Melde dich bei deinem HubSpot-Account an und gehe zu den Einstellungen > Integrationen > Private Apps.

<img src="img/createprivateappbutton.png" alt="Erstellen einer privanten App" width="400"/>

Konfiguriere deine App: Gib alle erforderlichen Informationen an, wie Name, Beschreibung, Bereiche (Scopes).

<img src="img/enterbasicinformation.png" alt="Eingeben der Basis Informationen" width="400"/>

Beim Bereiche (Scopes) sind folgende Werte anzugeben:

* crm.objects.companies Gelesen
* crm.objects.contacts Gelesen

<img src="img/enterscopescreate.png" alt="Auswählen der Bereiche (Scopes)" width="400"/>

Schritt 2: Erhalte deine App-Informationen
Nachdem du deine private App erstellt hast, erhältst du den Zugriffstoken.

<img src="img/privateappcreated.png" alt="Erstellter Zugriffstoken" width="200"/>

<img src="img/showaccesstoken.png" alt="Zugriffstoken anzeigen" width="400"/>