#!/bin/bash

# Variables
RESOURCE_GROUP_NAME="rg-group-16"
SUBSCRIPTION_ID="db7c2d44-82fa-4a66-99fe-a162b13ecf60"
LOCATION="east_us"

# Set Azure Subscription
az account set --subscription $SUBSCRIPTION_ID

# Importer les ressources de type azurerm_network_security_group
terraform import azurerm_network_security_group.nic-backup-001-nsg /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkSecurityGroups/nic-backup-001-nsg
terraform import azurerm_network_security_group.nic-ftp-001-nsg /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkSecurityGroups/nic-ftp-001-nsg
terraform import azurerm_network_security_group.nic-samba-001-nsg /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkSecurityGroups/nic-samba-001-nsg
terraform import azurerm_network_security_group.nic-web-001-nsg /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkSecurityGroups/nic-web-001-nsg
terraform import azurerm_network_security_group.nic-surveillance-001-nsg /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkSecurityGroups/nic-surveillance-001-nsg
terraform import azurerm_network_security_group.nic-firewall-001-nsg /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkSecurityGroups/nic-firewall-001-nsg

# Importer les ressources de type azurerm_virtual_network
terraform import azurerm_virtual_network.vnet-internal-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-001
terraform import azurerm_virtual_network.vnet-connectivity-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-connectivity-001
terraform import azurerm_virtual_network.vnet-internal-002 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-002
terraform import azurerm_virtual_network.vnet-internal-003 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-003
terraform import azurerm_virtual_network.vnet-internal-004 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-004
terraform import azurerm_virtual_network.vnet-internal-005 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-005

# Importer les ressources de type azurerm_subnet
terraform import azurerm_subnet.snet-internal-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-001/subnets/snet-internal-001
terraform import azurerm_subnet.snet-connectivity-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-connectivity-001/subnets/snet-connectivity-001
terraform import azurerm_subnet.snet-internal-002 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-002/subnets/snet-internal-002
terraform import azurerm_subnet.snet-internal-003 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-003/subnets/snet-internal-003
terraform import azurerm_subnet.snet-internal-004 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-004/subnets/snet-internal-004
terraform import azurerm_subnet.snet-internal-005 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-005/subnets/snet-internal-005

# Importer les ressources de type azurerm_public_ip
terraform import azurerm_public_ip.connectivity_ip /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/publicIPAddresses/vnet-connectivity-001-ip

# Importer les peering des VNets
terraform import azurerm_virtual_network_peering.vnet-internal-001_to_vnet-connectivity-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-001/virtualNetworkPeerings/vnet-internal-001-to-vnet-connectivity-001
terraform import azurerm_virtual_network_peering.vnet-internal-002_to_vnet-connectivity-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-002/virtualNetworkPeerings/vnet-internal-002-to-vnet-connectivity-001
terraform import azurerm_virtual_network_peering.vnet-internal-003_to_vnet-connectivity-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-003/virtualNetworkPeerings/vnet-internal-003-to-vnet-connectivity-001
terraform import azurerm_virtual_network_peering.vnet-internal-004_to_vnet-connectivity-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-004/virtualNetworkPeerings/vnet-internal-004-to-vnet-connectivity-001
terraform import azurerm_virtual_network_peering.vnet-internal-005_to_vnet-connectivity-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-internal-005/virtualNetworkPeerings/vnet-internal-005-to-vnet-connectivity-001
terraform import azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-001 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-connectivity-001/virtualNetworkPeerings/vnet-connectivity-001-to-vnet-internal-001
terraform import azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-002 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-connectivity-001/virtualNetworkPeerings/vnet-connectivity-001-to-vnet-internal-002
terraform import azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-003 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-connectivity-001/virtualNetworkPeerings/vnet-connectivity-001-to-vnet-internal-003
terraform import azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-004 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-connectivity-001/virtualNetworkPeerings/vnet-connectivity-001-to-vnet-internal-004
terraform import azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-005 /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/vnet-connectivity-001/virtualNetworkPeerings/vnet-connectivity-001-to-vnet-internal-005

# Route Table
terraform import azurerm_route_table.rt-networking-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/routeTables/rt-networking-001

# Subnet Route Table Associations
terraform import azurerm_subnet_route_table_association.rta-internal-snet-internal-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/your-vnet-name/subnets/snet-internal-001
terraform import azurerm_subnet_route_table_association.rta-internal-snet-internal-002 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/your-vnet-name/subnets/snet-internal-002
terraform import azurerm_subnet_route_table_association.rta-internal-snet-internal-003 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/your-vnet-name/subnets/snet-internal-003
terraform import azurerm_subnet_route_table_association.rta-internal-snet-internal-004 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/your-vnet-name/subnets/snet-internal-004
terraform import azurerm_subnet_route_table_association.rta-internal-snet-internal-005 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/your-vnet-name/subnets/snet-internal-005
terraform import azurerm_subnet_route_table_association.rta-connectivity-snet-connectivity-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/virtualNetworks/your-vnet-name/subnets/snet-connectivity-001

# Route Default
terraform import azurerm_route.default_route /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/routeTables/rt-networking-001/routes/route-default

# Route Inside
terraform import azurerm_route.inside_route /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/routeTables/rt-networking-001/routes/inside-route

# Network Interfaces
terraform import azurerm_network_interface.nic-site-web-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkInterfaces/nic-site-web-001
terraform import azurerm_network_interface.nic-ftp-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkInterfaces/nic-ftp-001
terraform import azurerm_network_interface.nic-surveillance-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkInterfaces/nic-surveillance-001
terraform import azurerm_network_interface.nic-samba-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkInterfaces/nic-samba-001
terraform import azurerm_network_interface.nic-backup-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkInterfaces/nic-backup-001
terraform import azurerm_network_interface.nic-bastion-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkInterfaces/nic-bastion-001
terraform import azurerm_network_interface.nic-firewall-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Network/networkInterfaces/nic-firewall-001

# Virtual Machines
terraform import azurerm_linux_virtual_machine.vm-site-web-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Compute/virtualMachines/vm-site-web-001
terraform import azurerm_linux_virtual_machine.vm-ftp-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Compute/virtualMachines/vm-ftp-001
terraform import azurerm_linux_virtual_machine.vm-surveillance-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Compute/virtualMachines/vm-surveillance-001
terraform import azurerm_linux_virtual_machine.vm-samba-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Compute/virtualMachines/vm-samba-001
terraform import azurerm_linux_virtual_machine.vm-backup-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Compute/virtualMachines/vm-backup-001
terraform import azurerm_linux_virtual_machine.vm-bastion-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Compute/virtualMachines/vm-bastion-001
terraform import azurerm_linux_virtual_machine.vm-firewall-001 /subscriptions/{subscription-id}/resourceGroups/$RESOURCE_GROUP_NAME/providers/Microsoft.Compute/virtualMachines/vm-firewall-001

echo "Les ressources ont été importées avec succès !"
