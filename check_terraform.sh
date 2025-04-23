#!/bin/bash

# Fonction pour vérifier si l'OS est macOS
is_mac() {
	[[ "$(uname)" == "Darwin" ]]
}

# Fonction pour vérifier si l'OS est Linux
is_linux() {
	[[ "$(uname)" == "Linux" ]]
}

# Vérifie si Terraform est installé
if ! command -v terraform &>/dev/null; then
	echo "Terraform n'est pas installé. Veuillez l'installer avant de continuer."
	exit 1
fi

# Installation de TFLint
if ! command -v tflint &>/dev/null; then
	echo "TFLint n'est pas installé. Installation en cours..."

	if is_mac; then
		# Installation via Homebrew pour macOS
		if ! command -v brew &>/dev/null; then
			echo "Homebrew n'est pas installé. Veuillez installer Homebrew avant de continuer."
			exit 1
		fi
		brew install tflint
	elif is_linux; then
		# Installation via apt pour Linux (Ubuntu/Debian)
		sudo apt update
		sudo apt install -y tflint
	else
		echo "Système d'exploitation non supporté pour l'installation automatique de TFLint."
		exit 1
	fi
fi

# Installation de Checkov dans un environnement virtuel
if ! command -v checkov &>/dev/null; then
	echo "Checkov n'est pas installé. Création de l'environnement virtuel et installation..."

	# Création de l'environnement virtuel
	python3 -m venv .venv
	source .venv/bin/activate

	# Installation de Checkov
	pip3 install --upgrade pip
	pip3 install checkov
	deactivate
fi

# Initialisation de Terraform
echo "Initialisation de Terraform..."
terraform init -backend=false

# Vérification du formatage Terraform
echo "Vérification du formatage Terraform..."
if ! terraform fmt -check -recursive; then
	echo "Des fichiers Terraform ne sont pas correctement formatés."
	read -p "Souhaitez-vous appliquer le formatage maintenant ? (y/N) " answer
	if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
		terraform fmt -recursive
		echo "Formatage appliqué."
	else
		echo "Formatage non appliqué. Veuillez corriger avant de faire une PR."
		exit 1
	fi
else
	echo "Formatage correct."
fi

# Validation de Terraform
echo "Validation de la configuration Terraform..."
terraform validate

# Exécution de TFLint
echo "Exécution de TFLint..."
tflint --init
tflint

# Exécution de Checkov
echo "Exécution de Checkov..."
source .venv/bin/activate
checkov -f *.tf --skip-check CKV_AZURE_50 --skip-check CKV2_AZURE_31
deactivate

echo "Toutes les vérifications ont été terminées."
