
In order for the ilink CRM Extensions to access the contacts in HubSpot, you need an access token.

Step 1: Create a private app in HubSpot
Sign in to your HubSpot account and go to Settings > Integrations > Private Apps.

<img src="img/createprivateappbutton.png" alt="Create a private app" width="400"/>

Configure your app: Provide all required information such as name, description, scopes.

<img src="img/enterbasicinformation.png" alt="Enter basic information" width="400"/>

The following values must be specified for the scope:

* crm.objects.companies Read
* crm.objects.contacts Read

<img src="img/enterscopescreate.png" alt="Select scopes" width="400"/>

Step 2: Get your app information
After you create your private app, you will receive the access token.

<img src="img/privateappcreated.png" alt="Created access token" width="200"/>

<img src="img/showaccesstoken.png" alt="Show access token" width="400"/>