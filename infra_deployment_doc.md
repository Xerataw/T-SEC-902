# Documentation de déploiement de l'infrastructure IaC Azure

## 📁 Organisation du projet

```
infra/
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── output.tf
├── ansible/
│   ├── hosts
│   ├── initialisation_teleport/
│   │   └── playbook.yml
│   └── initialisation_bastion_ansible/
│       └── playbook.yml
└── pfSense/
    └── deploy_pfsense.sh
```

---

## 🧱 Étape 1 – Déploiement de l'infrastructure avec Terraform

### 🔧 Prérequis

- Avoir un compte Azure actif
- Azure CLI configurée (`az login`)
- Terraform installé (`terraform -v`)

### 📄 Variables attendues

Dans `variables.tf`, seule la variable suivante est à configurer :

```hcl
variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure"
  type        = string
}
```

### ▶️ Commandes à exécuter

Depuis le dossier `terraform/` :

```bash
cd terraform/

# Initialiser Terraform
terraform init

# Vérifier le plan d'exécution
terraform plan -out main.tfplan -var="resource_group_name=MonGroupeDeRessources"

# Appliquer le plan
terraform apply "main.tfplan"
```

### 📤 Récupération de l’IP publique

Une fois le plan appliqué, Terraform affiche les sorties configurées dans `output.tf`.

```hcl
output "bastion_public_ip" {
  value = azurerm_public_ip.bastion_ip.ip_address
}
```

Copiez l'IP publique pour la suite.

---

## 🤖 Étape 2 – Configuration initiale avec Ansible

### 📝 Modifier le fichier `hosts`

Dans `ansible/hosts`, remplacez `x.x.x.x` par l’IP publique du bastion obtenue via Terraform.

```ini
[vm-bastion-001]
x.x.x.x ansible_user=adminuser ansible_ssh_private_key_file=../terraform/terraform_azure_key_ssh/sec_azure_key
```

### 🛠 Playbooks à exécuter

1. **Installation de Teleport**
   ```bash
   cd ansible/
   ansible-playbook -i hosts initialisation_teleport/playbook.yml
   ```

2. **Préparer la VM bastion comme machine maître Ansible**
   ```bash
   ansible-playbook -i hosts initialisation_bastion_ansible/playbook.yml
   ```

Cette deuxième étape configure automatiquement la VM bastion pour exécuter localement tous les playbooks Ansible copiés (depuis le dossier `Ressources`) sur les VMs de l’infra.

---

## 🔐 Étape 3 – Déploiement de la VM pfSense (firewall)

### 📂 Fichier à utiliser

Dans le dossier `pfSense/` :

```bash
cd pfSense/
./deploy_pfsense.sh \
  --resource-group MonGroupeDeRessources \
  --vhd-local-path ./pfsense-custom.vhd
```

Le script réalise :

- L’upload du VHD personnalisé sur un Storage Account Azure
- La création d’une image personnalisée basée sur ce VHD

### 🖥️ Création manuelle de la VM

Depuis le portail Azure :

1. Créer une **VM** en utilisant l’image personnalisée créée.
2. Paramètres recommandés :
   - **Taille** : `Standard_B1s`
   - **Type de disque** : SSD standard
   - **Zone de disponibilité** : Zone 2
3. Terminer la création sans attacher d’interface publique.

### 🌐 Accès et configuration pfSense

1. Accéder à l'interface web via un tunnel ou réseau local.
2. **Importer votre configuration** `.xml` existante pour appliquer les paramètres pfSense.

---

## ✅ Résumé

| Étape | Description |
|-------|-------------|
| 1 | Déployer les ressources avec Terraform |
| 2 | Récupérer l’IP publique du bastion |
| 3 | Modifier `hosts` Ansible et exécuter les playbooks |
| 4 | Déployer pfSense via script + portail Azure |
| 5 | Importer la configuration pfSense |

---

## 🔗 Astuces & Tips

- Pour éviter les confirmations SSH, un fichier `ansible.cfg` peut être utilisé avec :
  ```ini
  [defaults]
  host_key_checking = False
  ```

- Pour superviser les playbooks lancés automatiquement, consultez les fichiers logs ou utilisez `debug` dans les tâches Ansible.

---
