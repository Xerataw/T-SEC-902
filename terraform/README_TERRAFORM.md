## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_ansible"></a> [ansible](#requirement\_ansible) | ~> 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =4.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm-backup-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.vm-bastion-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.vm-firewall-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.vm-ftp-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.vm-samba-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.vm-site-web-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.vm-surveillance-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic-backup-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic-bastion-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic-firewall-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic-ftp-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic-samba-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic-site-web-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface.nic-surveillance-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.nic_backup_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nic_bastion_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nic_firewall_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nic_ftp_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nic_samba_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nic_surveillance_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_interface_security_group_association.nic_web_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.nic-backup-001-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nic-firewall-001-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nic-ftp-001-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nic-samba-001-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nic-surveillance-001-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.nic-web-001-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.connectivity_ip](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/public_ip) | resource |
| [azurerm_route.default_route](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/route) | resource |
| [azurerm_route.inside_route](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/route) | resource |
| [azurerm_route_table.rt-networking-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/route_table) | resource |
| [azurerm_subnet.snet-connectivity-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet) | resource |
| [azurerm_subnet.snet-internal-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet) | resource |
| [azurerm_subnet.snet-internal-002](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet) | resource |
| [azurerm_subnet.snet-internal-003](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet) | resource |
| [azurerm_subnet.snet-internal-004](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet) | resource |
| [azurerm_subnet.snet-internal-005](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet) | resource |
| [azurerm_subnet_route_table_association.rta-connectivity-snet-connectivity-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.rta-internal-snet-internal-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.rta-internal-snet-internal-002](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.rta-internal-snet-internal-003](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.rta-internal-snet-internal-004](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet_route_table_association) | resource |
| [azurerm_subnet_route_table_association.rta-internal-snet-internal-005](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network.vnet-connectivity-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network.vnet-internal-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network.vnet-internal-002](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network.vnet-internal-003](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network.vnet-internal-004](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network.vnet-internal-005](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-002](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-003](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-004](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet-connectivity-001_to_vnet-internal-005](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet-internal-001_to_vnet-connectivity-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet-internal-002_to_vnet-connectivity-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet-internal-003_to_vnet-connectivity-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet-internal-004_to_vnet-connectivity-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.vnet-internal-005_to_vnet-connectivity-001](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.17.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Nom de la ressource dans Azure | `string` | `"rg-group-16"` | no |

## Outputs

No outputs.
