#!/bin/bash

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
print_message() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérification de l'existence des fichiers
if [ ! -f "main.tf" ]; then
    print_error "Le fichier main.tf n'existe pas dans le répertoire courant"
    exit 1
fi

if [ ! -f "remove_ssh.tf" ]; then
    print_error "Le fichier remove_ssh.tf n'existe pas dans le répertoire courant"
    exit 1
fi

# Sauvegarde de la configuration actuelle
print_message "Sauvegarde de la configuration actuelle..."
mv main.tf main.tf.bak

# Application de la nouvelle configuration
print_message "Application de la configuration sans SSH..."
mv remove_ssh.tf main.tf

# Exécution de terraform plan
print_message "Exécution de terraform plan..."
terraform plan

# Demande de confirmation
read -p "Voulez-vous appliquer ces changements ? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    print_warning "Opération annulée, restauration de la configuration précédente..."
    mv main.tf remove_ssh.tf
    mv main.tf.bak main.tf
    exit 1
fi

# Exécution de terraform apply
print_message "Exécution de terraform apply..."
terraform apply -auto-approve

# Restauration des noms de fichiers
print_message "Restauration des noms de fichiers..."
mv main.tf remove_ssh.tf
mv main.tf.bak main.tf

print_message "Opération terminée avec succès !" 