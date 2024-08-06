
### Domino LDAP Datenschema

Das `inetOrgPerson`-Objektklassen-Schema ist eine Erweiterung des Standard LDAP (Lightweight Directory Access Protocol)-Schemas und wird auch im HCL Domino Verzeichnis verwendet. Es dient dazu, zusätzliche Attribute zur Beschreibung von Personen in einem Verzeichnis hinzuzufügen.

Hier ist eine Übersicht der wichtigsten Attribute, die im `inetOrgPerson`-Schema enthalten sind, und wie sie im Kontext von HCL Domino verwendet werden können:

### `inetOrgPerson`-Objektklasse

#### Allgemeine Attribute:
1. **cn (commonName)**
   - **Beschreibung**: Der vollständige Name der Person.
   - **Beispiel**: "Erika Mustermann"

2. **sn (surname)**
   - **Beschreibung**: Der Nachname der Person.
   - **Beispiel**: "Mustermann"

3. **givenName**
   - **Beschreibung**: Der Vorname der Person.
   - **Beispiel**: "Erika"

4. **mail**
   - **Beschreibung**: Die E-Mail-Adresse der Person.
   - **Beispiel**: "erika.mustermann@beispiel.de"

5. **uid (userID)**
   - **Beschreibung**: Der eindeutige Benutzername oder die Benutzer-ID.
   - **Beispiel**: "emustermann"

6. **telephoneNumber**
   - **Beschreibung**: Die Telefonnummer der Person.
   - **Beispiel**: "+49 170 1234567"

#### Erweiterte Attribute:
7. **title**
   - **Beschreibung**: Der berufliche Titel der Person.
   - **Beispiel**: "Software Ingenieurin"

8. **ou (organizationalUnit)**
   - **Beschreibung**: Die Organisationseinheit, der die Person angehört.
   - **Beispiel**: "Entwicklungsteam"

9. **o (organizationName)**
   - **Beschreibung**: Der Name der Organisation.
   - **Beispiel**: "Beispiel"

10. **l (localityName)**
    - **Beschreibung**: Der Ort oder die Stadt.
    - **Beispiel**: "Berlin"

11. **st (stateOrProvinceName)**
    - **Beschreibung**: Der Bundesstaat oder die Provinz.
    - **Beispiel**: "Berlin"

12. **postalCode**
    - **Beschreibung**: Die Postleitzahl.
    - **Beispiel**: "10115"

13. **street**
    - **Beschreibung**: Die Straßenadresse.
    - **Beispiel**: "Friedrichstraße 123"

14. **employeeNumber**
    - **Beschreibung**: Die Mitarbeiternummer.
    - **Beispiel**: "123456"

15. **employeeType**
    - **Beschreibung**: Der Beschäftigungstyp.
    - **Beispiel**: "Vollzeit"

16. **manager**
    - **Beschreibung**: Der Distinguished Name (DN) des Managers der Person.
    - **Beispiel**: "cn=Max Meier,ou=Management,o=Beispiel"

17. **description**
    - **Beschreibung**: Eine Beschreibung oder Anmerkungen zur Person.
    - **Beispiel**: "Teamleiterin für das Entwicklungsteam."

### HCL Domino-spezifische Attribute

HCL Domino kann zusätzliche, spezifische Attribute verwenden, die über das Standard-`inetOrgPerson`-Schema hinausgehen. Einige davon können benutzerdefinierte Felder oder spezielle Domino-Eigenschaften sein.

- **dominoPersonType**
  - **Beschreibung**: Ein Attribut zur Beschreibung des Typs des Domino-Benutzers.
  - **Beispiel**: "User"

- **dominoAccessGroup**
  - **Beschreibung**: Gruppenmitgliedschaften in Domino-spezifischen Zugriffsgruppen.
  - **Beispiel**: "CN=Admins/O=Beispiel"

### Beispiel-Datensatz

```
dn: uid=emustermann,ou=Entwicklungsteam,o=Beispiel
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: person
objectClass: top
cn: Erika Mustermann
sn: Mustermann
givenName: Erika
mail: erika.mustermann@beispiel.de
uid: emustermann
telephoneNumber: +49 170 1234567
title: Software Ingenieurin
ou: Entwicklungsteam
o: Beispiel
l: Berlin
st: Berlin
postalCode: 10115
street: Friedrichstraße 123
employeeNumber: 123456
employeeType: Vollzeit
manager: cn=Max Meier,ou=Management,o=Beispiel
description: Teamleiterin für das Entwicklungsteam.
```
