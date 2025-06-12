# Ce fichier est utilisé pour supprimer les règles SSH des groupes de sécurité réseau
# À exécuter après avoir terminé les playbooks Ansible

# Suppression de la règle SSH pour le NSG FTP
resource "azurerm_network_security_group" "nic-ftp-001-nsg" {
  name                = "nic-ftp-001-nsg"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-SSH-From-Teleport"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3022"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Rsyslog"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "514"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-FTP-From-Connectivity"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "21"
    source_address_prefix      = "10.1.0.0/16"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-FTP-Passive-From-Connectivity"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1024-1048"
    source_address_prefix      = "10.1.0.0/16"
    destination_address_prefix = "*"
  }
}

# Suppression de la règle SSH pour le NSG Web
resource "azurerm_network_security_group" "nic-web-001-nsg" {
  name                = "nic-web-001-nsg"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-SSH-From-Teleport"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3022"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Rsyslog"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "514"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Suppression de la règle SSH pour le NSG Surveillance
resource "azurerm_network_security_group" "nic-surveillance-001-nsg" {
  name                = "nic-surveillance-001-nsg"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-SSH-From-Teleport"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3022"
    source_address_prefix      = "10.0.0.0/8"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Rsyslog"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "514"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
} 