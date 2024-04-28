#!/bin/bash

read -p "Please enter the length of your password: " PASS_LENGTH

# Generating the password

for p in $(seq 1); do
	password=$(openssl rand -base64 48 | cut -c1-$PASS_LENGTH)
done

# Asking for showing the hash

read -p "Do you want to see the hash of your password? (yes/no): " SHOW_HASH

if [ "$SHOW_HASH" = "yes" ];
then

# Generating salt

	salt=$(openssl rand -hex 16)

# Combining the salt and password

	salted_password="$salt$password"

# Generating the hash

	hash=$(echo -n "$salted_password" | openssl dgst -sha256 | cut -d' ' -f2)

	echo "Your password: $password"
	echo "Salt: $salt"
	echo "Hashed version: $hash"
else
	echo "Your password: $password"
fi
