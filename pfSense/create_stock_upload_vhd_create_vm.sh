#!/bin/bash

########
# Avant utilisation ajouter le path full format de votre vhd pfSense ligne 28
# Il convient également de rajouter votre ressource
########

# Define the .env file path
ENV_FILE=".env"

# Check if .env file exists
if [ ! -f "${ENV_FILE}" ]; then
  echo ".env file does not exist. Creating it..."

  # Generate a 5-digit random number
  RANDOM_NUMBER=$((RANDOM % 90000 + 10000))

  echo "RANDOM_NUMBER=${RANDOM_NUMBER}" >"${ENV_FILE}"
  echo ".env file created with RANDOM_NUMBER=${RANDOM_NUMBER}"
else
  echo ".env file already exists. No changes made."
fi

source "${ENV_FILE}"

# Variables
RESOURCE_GROUP_NAME=""
LOCATION="eastus"
STORAGE_ACCOUNT_NAME="pfsensevhds${RANDOM_NUMBER}"
CONTAINER_NAME="vhds"
VHD_FILE_PATH=""

# Vérification du chemin VHD
if [ -z "${VHD_FILE_PATH}" ]; then
    echo "Avant utilisation ajouter le path full format de votre vhd pfSense ligne 28"
    exit 1
fi

# Create the storage account
echo "Creating storage account: ${STORAGE_ACCOUNT_NAME}..."
az storage account create \
  --name "${STORAGE_ACCOUNT_NAME}" \
  --resource-group "${RESOURCE_GROUP_NAME}" \
  --location "${LOCATION}" \
  --sku Standard_LRS \
  --kind StorageV2 \
  -o table

if [ $? -ne 0 ]; then
  echo "Failed to create storage account. Exiting."
  exit 1
fi

# Get storage account key
echo "Retrieving storage account key..."
ACCOUNT_KEY=$(az storage account keys list \
  --account-name "${STORAGE_ACCOUNT_NAME}" \
  --resource-group "${RESOURCE_GROUP_NAME}" \
  --query "[0].value" -o tsv)

if [ -z "${ACCOUNT_KEY}" ]; then
  echo "Failed to retrieve storage account key. Exiting."
  exit 1
fi

# Create the blob container
echo "Creating blob container: ${CONTAINER_NAME}..."
az storage container create \
  --name "${CONTAINER_NAME}" \
  --account-name "${STORAGE_ACCOUNT_NAME}" \
  --account-key "${ACCOUNT_KEY}" \
  -o table

if [ $? -ne 0 ]; then
  echo "Failed to create blob container. Exiting."
  exit 1
fi

# Upload the VHD file
echo "Uploading VHD file..."
az storage blob upload \
  --account-name "${STORAGE_ACCOUNT_NAME}" \
  --account-key "${ACCOUNT_KEY}" \
  --container-name "${CONTAINER_NAME}" \
  --file "${VHD_FILE_PATH}" \
  --name "$(basename "${VHD_FILE_PATH}")" \
  --max-connections 8 \
  --overwrite \
  -o table

if [ $? -eq 0 ]; then
  echo "✅ VHD file uploaded successfully!"
else
  echo "❌ Failed to upload the VHD file."
  exit 1
fi

set -eu

# Define the .env file path
ENV_FILE=".env"

# Check if .env file exists
if [ ! -f "${ENV_FILE}" ]; then
  echo ".env file does not exist. Please run create_sa_and_upload.sh script first."
  exit 1
else
  source "${ENV_FILE}"
fi

# Variables
env="play"
loc="eastus"
org="pfsense"
location="East US"
rgp_vnet="rg-group-16"
rgp_pfsense="rg-group-16"
sa_account_name="pfsensevhds${RANDOM_NUMBER}"
vnet_name="vnet-connectivity-001"
vnet_prefix="10.0.0.0/16"
vnet_subnets=$(
  cat <<EOF
[
    {
        "name": "external",
        "addressPrefix": "10.1.2.0/24"
    },
    {
        "name": "internal",
        "addressPrefix": "10.1.3.0/24"
    }
]
EOF
)
vmName="vm-${loc}-${org}-${env}-pfsense"
vmSize="Standard_B1s"
vhdUri="https://${sa_account_name}.blob.core.windows.net/vhds/pfsence.vhd"
nsg_name="nsg-${loc}-${org}-${env}-pfsense-ext"

az config set core.display_region_identified=false # stop warning about cheaper in alternative region

echo "Creating Subnets"
for subnet in $(printf "%s" "${vnet_subnets}" | jq -c '.[]'); do
  name=$(printf "%s" "${subnet}" | jq -r '.name')
  addressPrefix=$(printf "%s" "${subnet}" | jq -r '.addressPrefix')

  exists=$(az network vnet subnet list -g "${rgp_vnet}" --vnet-name "${vnet_name}" --query "[?name==\`${name}\`].name" -o tsv)
  if [[ "${name}" != "$exists" ]]; then
    az network vnet subnet create -n "${name}" --vnet-name "${vnet_name}" -g "${rgp_vnet}" --address-prefixes "${addressPrefix}" -o table
  else
    printf "\n(skipped - subnet exists)\n\n"
    az network vnet subnet show -g "${rgp_vnet}" --vnet-name "${vnet_name}" -n "${name}" -o table
  fi
done

# Get the VNet details
echo "Retrieving VNET details"
vnet_id=$(az network vnet show --name "${vnet_name}" --resource-group "${rgp_vnet}" --query "id" -o tsv)
snet_internal_id=$(az network vnet subnet show --name internal --vnet-name "${vnet_name}" --resource-group "${rgp_vnet}" --query "id" -o tsv)
snet_external_id=$(az network vnet subnet show --name external --vnet-name "${vnet_name}" --resource-group "${rgp_vnet}" --query "id" -o tsv)

# Create a public IP address
echo "Creating Public IP"
public_ip_id=$(az network public-ip create --name "pubip-${loc}-pfsense-${env}" --resource-group "${rgp_pfsense}" --location "${location}" --allocation-method "Static" --zone 1 2 3 --query "publicIp.id" -o tsv)

# Create NICs
echo "Creating Network Interfaces"
az network nic create --name "vnic-${loc}-pfsense-${env}-ext" --resource-group "${rgp_pfsense}" --location "${location}" --subnet "${snet_external_id}" --public-ip-address "${public_ip_id}" -o table
az network nic create --name "vnic-${loc}-pfsense-${env}-int" --resource-group "${rgp_pfsense}" --location "${location}" --subnet "${snet_internal_id}" -o table

echo "Creating Image"
az image create --resource-group "${rgp_pfsense}" --name PfSenseImage --source "${vhdUri}" --os-type Linux --hyper-v-generation V2 -o table

image_id=$(az image show --resource-group "${rgp_pfsense}" --name PfSenseImage --query id -o tsv)

# Create VM configuration
echo "Creating Virtual Machine"
az vm create --resource-group "${rgp_pfsense}" --name "${vmName}" \
  --size "${vmSize}" --generate-ssh-keys \
  --image "${image_id}" --storage-sku Standard_LRS \
  --nics "vnic-${loc}-pfsense-${env}-ext" "vnic-${loc}-pfsense-${env}-int" \
  -o table

echo "Enable Boot Diagnostics"
az vm boot-diagnostics enable --name "${vmName}" --resource-group "${rgp_pfsense}" -o table

echo "Create Network Security Group"
az network nsg create --resource-group "${rgp_pfsense}" --name "${nsg_name}" -o table

az network nsg rule create --resource-group "${rgp_pfsense}" --nsg-name "${nsg_name}" --name "AllowAnyHTTPSInbound" \
  --source-address-prefixes Internet --destination-port-ranges 443 --access Allow --protocol Tcp --priority 100 -o table

az network nic update --name "vnic-${loc}-pfsense-${env}-ext" --resource-group "${rgp_pfsense}" --network-security-group "${nsg_name}" -o table
