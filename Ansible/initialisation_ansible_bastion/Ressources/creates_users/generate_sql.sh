#!/bin/bash

# Vérifie que Python et pip sont installés
if ! command -v python3 &> /dev/null; then
    echo "Python3 n'est pas installé. Installation..."
    sudo apt update && sudo apt install -y python3
fi

if ! command -v pip3 &> /dev/null; then
    echo "pip3 n'est pas installé. Installation..."
    sudo apt install -y python3-pip
fi

# Installation de faker si nécessaire
pip3 install faker --quiet

# Création du script Python temporaire
cat << 'EOF' > /tmp/generate_sql.py
import hashlib
import random
from faker import Faker

fake = Faker("fr_FR")
statuses = ["client", "prospect", "vip"]

print("DROP TABLE IF EXISTS users;")
print("""
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    email TEXT UNIQUE,
    password TEXT,
    customer_status TEXT,
    last_meeting DATE
);
""")

for i in range(100):
    first = fake.first_name()
    last = fake.last_name()
    email = fake.email()
    password = fake.password(length=10)
    hashed_pw = hashlib.sha256(password.encode()).hexdigest()
    status = random.choice(statuses)
    date = fake.date_between(start_date='-1y', end_date='today')
    
    print(f"INSERT INTO users (first_name, last_name, email, password, customer_status, last_meeting) VALUES (\"{first}\", \"{last}\", \"{email}\", \"{hashed_pw}\", \"{status}\", \"{date}\");")
EOF

# Exécution du script pour générer le fichier SQL
echo "Génération du fichier SQL..."
python3 /tmp/generate_sql.py > /srv/ftp/fake_users.sql

# Nettoyage
rm /tmp/generate_sql.py

# Droits d'accès
sudo chown ftp:ftp /srv/ftp/fake_users.sql
sudo chmod 644 /srv/ftp/fake_users.sql

echo "✅ Fichier fake_users.sql généré dans /srv/ftp/"
