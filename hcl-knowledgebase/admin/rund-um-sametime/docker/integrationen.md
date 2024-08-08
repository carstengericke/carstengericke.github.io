
.env:
ENABLE_LTPA=true
LTPA_KEYS_FILE_PATH=./ltpa-config/ltpa.keys
LTPA_KEYS=/ltpa-config/ltpa.keys
LTPA_KEYS_PASSWORD=secret

custom.env:
# Enable LTPA authentication for Business Cards (https://opensource.hcltechsw.com/sametime-doc/v1202/admin/ltpa_configure_docker.html)
# In [ST_BB_NAMES] section, set ST_AUTH_TOKEN
# ST_BB_NAMES section is used for configuring various settings related to the Sametime server's Business Card Service (BCS).
# This service is responsible for managing and displaying user profile information, such as names, email addresses, phone numbers, and other contact details.
# Settings like ST_AUTH_TOKEN determine the methods and tokens used for authenticating and authorizing requests to the Business Card Service.
# This ensures that only authorized services and users can access or modify profile information.
# server can "fork" the authentication process and use different mechanisms depending on the token type it encounters
# JWT is a compact, URL-safe means of representing claims to be transferred between two parties
# LTPA is a token-based authentication mechanism used in IBM/HCL environments. It provides single sign-on (SSO) capabilities
STI__ST_BB_NAMES__ST_AUTH_TOKEN=Fork:Jwt,Ltpa
# Enabling content security headers (https://opensource.hcltechsw.com/sametime-doc/v1202/admin/verse_integration_contentsecurity_docker.html)
CONTENT_SECURITY_POLICY=frame-ancestors https://*.company_domain.com

Verify:
docker-compose.yaml:
    auth:
        ...
        volumes:
            - ${LTPA_KEYS_FILE_PATH}:/ltpa-config/ltpa.keys:Z
        ...
