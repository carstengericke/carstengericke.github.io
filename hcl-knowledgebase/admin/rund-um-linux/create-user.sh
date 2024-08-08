#!/bin/bash

# Skript zum Erstellen eines Benutzers, Konvertieren eines SSH-Keys, und Gewähren von sudo-Rechten

# Überprüfen, ob die richtige Anzahl von Argumenten übergeben wurden
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <public_key_file>"
    exit 1
fi

USERNAME=$1
PUBLICKEY_FILE=$2

# Arbeitsverzeichnis
WORKING_DIR=$(pwd)

# Name der temporären Datei, die den Benutzernamen enthält
TEMP_KEY_FILE="$WORKING_DIR/${USERNAME}_temp_key.pub"

# Benutzer erstellen
echo "Creating user $USERNAME..."
sudo useradd -m "$USERNAME" || { echo "User creation failed"; exit 1; }

# Passwort des Benutzers deaktivieren
echo "Disabling password for user $USERNAME..."
sudo passwd -d "$USERNAME" || { echo "Failed to disable password"; exit 1; }

# Home-Verzeichnis des Benutzers
USER_HOME="/home/$USERNAME"

# Verzeichnis für SSH-Schlüssel erstellen
echo "Setting up SSH directory..."
sudo mkdir -p "$USER_HOME/.ssh"
sudo chmod 700 "$USER_HOME/.ssh"

# Überprüfen, ob die Datei existiert
if [ ! -f "$PUBLICKEY_FILE" ]; then
    echo "Public key file does not exist: $PUBLICKEY_FILE"
    exit 1
fi

# Versuchen, den Schlüssel zu konvertieren
echo "Attempting to convert key..."
if ssh-keygen -i -f "$PUBLICKEY_FILE" > "$TEMP_KEY_FILE" 2>/dev/null; then
    echo "Key successfully converted."
else
    echo "Failed to convert key. Using original key file."
    cp "$PUBLICKEY_FILE" "$TEMP_KEY_FILE"
fi

# Schlüssel in die authorized_keys-Datei einfügen
echo "Adding SSH public key..."
sudo cat "$TEMP_KEY_FILE" | sudo tee -a "$USER_HOME/.ssh/authorized_keys" > /dev/null

# Berechtigungen für authorized_keys festlegen
sudo chmod 600 "$USER_HOME/.ssh/authorized_keys"

# Besitzer der .ssh-Verzeichnisse und -Dateien festlegen
sudo chown -R "$USERNAME:$USERNAME" "$USER_HOME/.ssh"

# Benutzer zur linux_admin-Gruppe hinzufügen
echo "Adding user $USERNAME to linux_admin group..."
sudo usermod -aG linux_admin "$USERNAME"

# Optional: Benutzer zur notes_group hinzufügen
# sudo usermod -aG notes "$USERNAME"

# Optional: Benutzer zur wheel-Gruppe hinzufügen, um sudo-Rechte zu erhalten
# sudo usermod -aG wheel "$USERNAME"

# Temporäre Datei entfernen
rm "$TEMP_KEY_FILE"

echo "User $USERNAME created and configured successfully."
