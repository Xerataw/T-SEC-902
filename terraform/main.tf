#Provider
provider "azurerm" {
  features {}
  subscription_id = "db7c2d44-82fa-4a66-99fe-a162b13ecf60"
  #resource_provider_registrations = "none"
}

# Resource Group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Règle de sécurités réseaux 
resource "azurerm_network_security_group" "nic-backup-001-nsg" {
  name                = "nic-backup-001-nsg"
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
    source_address_prefixes    = ["VirtualNetwork"]
    destination_address_prefix = "*"
  }
}

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
    source_address_prefixes    = ["VirtualNetwork"]
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "nic-samba-001-nsg" {
  name                = "nic-samba-001-nsg"
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
    source_address_prefixes    = ["VirtualNetwork"]
    destination_address_prefix = "*"
  }
}

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
    source_address_prefixes    = ["VirtualNetwork"]
    destination_address_prefix = "*"
  }
}

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
    source_address_prefixes    = ["VirtualNetwork"]
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "nic-firewall-001-nsg" {
  name                = "nic-firewall-001-nsg"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-Https-For-Teleport"
    priority                   = 3096
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefixes    = ["Internet"]
    destination_address_prefix = "*"
  }
}

# VNet 1
resource "azurerm_virtual_network" "vnet-internal-001" {
  name                = "vnet-internal-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "snet-internal-001" {
  name                 = "snet-internal-001"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-internal-001.name
  address_prefixes     = ["10.0.1.0/24"]
}

# VNet internet
resource "azurerm_virtual_network" "vnet-connectivity-001" {
  name                = "vnet-connectivity-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "snet-connectivity-001" {
  name                 = "snet-connectivity-001"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-connectivity-001.name
  address_prefixes     = ["10.1.1.0/24"]
}

# IP public connectivity-001
resource "azurerm_public_ip" "connectivity_ip" {
  name                = "vnet-connectivity-001-ip"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# VNet 2
resource "azurerm_virtual_network" "vnet-internal-002" {
  name                = "vnet-internal-002"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "snet-internal-002" {
  name                 = "snet-internal-002"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-internal-002.name
  address_prefixes     = ["10.2.1.0/24"]
}

# VNet 3
resource "azurerm_virtual_network" "vnet-internal-003" {
  name                = "vnet-internal-003"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.3.0.0/16"]
}

resource "azurerm_subnet" "snet-internal-003" {
  name                 = "snet-internal-003"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-internal-003.name
  address_prefixes     = ["10.3.1.0/24"]
}

# VNet 4
resource "azurerm_virtual_network" "vnet-internal-004" {
  name                = "vnet-internal-004"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.4.0.0/16"]
}

resource "azurerm_subnet" "snet-internal-004" {
  name                 = "snet-internal-004"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-internal-004.name
  address_prefixes     = ["10.4.1.0/24"]
}

# VNet 5
resource "azurerm_virtual_network" "vnet-internal-005" {
  name                = "vnet-internal-005"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.5.0.0/16"]
}

resource "azurerm_subnet" "snet-internal-005" {
  name                 = "snet-internal-005"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-internal-005.name
  address_prefixes     = ["10.5.1.0/24"]
}

# Peering entre les VNets
resource "azurerm_virtual_network_peering" "vnet-internal-001_to_vnet-connectivity-001" {
  name                         = "vnet-internal-001-to-vnet-connectivity-001"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-internal-001.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-connectivity-001.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet-internal-002_to_vnet-connectivity-001" {
  name                         = "vnet-internal-002-to-vnet-connectivity-001"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-internal-002.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-connectivity-001.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet-internal-003_to_vnet-connectivity-001" {
  name                         = "vnet-internal-003-to-vnet-connectivity-001"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-internal-003.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-connectivity-001.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet-internal-004_to_vnet-connectivity-001" {
  name                         = "vnet-internal-004-to-vnet-connectivity-001"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-internal-004.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-connectivity-001.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet-internal-005_to_vnet-connectivity-001" {
  name                         = "vnet-internal-005-to-vnet-connectivity-001"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-internal-005.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-connectivity-001.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet-connectivity-001_to_vnet-internal-001" {
  name                         = "vnet-connectivity-001-to-vnet-internal-001"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-connectivity-001.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-internal-001.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet-connectivity-001_to_vnet-internal-002" {
  name                         = "vnet-connectivity-001-to-vnet-internal-002"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-connectivity-001.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-internal-002.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet-connectivity-001_to_vnet-internal-003" {
  name                         = "vnet-connectivity-001-to-vnet-internal-003"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-connectivity-001.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-internal-003.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet-connectivity-001_to_vnet-internal-004" {
  name                         = "vnet-connectivity-001-to-vnet-internal-004"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-connectivity-001.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-internal-004.id
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "vnet-connectivity-001_to_vnet-internal-005" {
  name                         = "vnet-connectivity-001-to-vnet-internal-005"
  resource_group_name          = data.azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet-connectivity-001.name
  remote_virtual_network_id    = azurerm_virtual_network.vnet-internal-005.id
  allow_virtual_network_access = true
}

# Table de routage
resource "azurerm_route_table" "rt-networking-001" {
  name                = "rt-networking-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Associer la table de routage aux sous-réseaux
resource "azurerm_subnet_route_table_association" "rta-internal-snet-internal-001" {
  subnet_id      = azurerm_subnet.snet-internal-001.id
  route_table_id = azurerm_route_table.rt-networking-001.id
}

# Associer la table de routage aux sous-réseaux
resource "azurerm_subnet_route_table_association" "rta-internal-snet-internal-002" {
  subnet_id      = azurerm_subnet.snet-internal-002.id
  route_table_id = azurerm_route_table.rt-networking-001.id
}

# Associer la table de routage aux sous-réseaux
resource "azurerm_subnet_route_table_association" "rta-internal-snet-internal-003" {
  subnet_id      = azurerm_subnet.snet-internal-003.id
  route_table_id = azurerm_route_table.rt-networking-001.id
}

# Associer la table de routage aux sous-réseaux
resource "azurerm_subnet_route_table_association" "rta-internal-snet-internal-004" {
  subnet_id      = azurerm_subnet.snet-internal-004.id
  route_table_id = azurerm_route_table.rt-networking-001.id
}

# Associer la table de routage aux sous-réseaux
resource "azurerm_subnet_route_table_association" "rta-internal-snet-internal-005" {
  subnet_id      = azurerm_subnet.snet-internal-005.id
  route_table_id = azurerm_route_table.rt-networking-001.id
}

resource "azurerm_subnet_route_table_association" "rta-connectivity-snet-connectivity-001" {
  subnet_id      = azurerm_subnet.snet-connectivity-001.id
  route_table_id = azurerm_route_table.rt-networking-001.id
}

#Route par défaut pour la communication entre VNets et Internet
resource "azurerm_route" "default_route" {
  name                = "route-default"
  resource_group_name = data.azurerm_resource_group.rg.name
  route_table_name    = azurerm_route_table.rt-networking-001.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}

# Route interne pour la communication entre VNETS
resource "azurerm_route" "inside_route" {
  name                = "inside-route"
  resource_group_name = data.azurerm_resource_group.rg.name
  route_table_name    = azurerm_route_table.rt-networking-001.name
  address_prefix      = "10.0.0.0/32"
  next_hop_type       = "VirtualNetworkGateway"
}

# Network Interface for each VM site-web-001
resource "azurerm_network_interface" "nic-site-web-001" {
  name                = "nic-site-web-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.snet-internal-001.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_web_assoc" {
  network_interface_id      = azurerm_network_interface.nic-site-web-001.id
  network_security_group_id = azurerm_network_security_group.nic-web-001-nsg.id
}

# Virtual Machines
resource "azurerm_linux_virtual_machine" "vm-site-web-001" {
  name                = "vm-site-web-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ## 8$ par mois
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./terraform_azure_key_ssh/sec_azure_key.pub")
  }

  network_interface_ids = [azurerm_network_interface.nic-site-web-001.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# Network Interface for each VM ftp-001
resource "azurerm_network_interface" "nic-ftp-001" {
  name                = "nic-ftp-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.snet-internal-002.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_ftp_assoc" {
  network_interface_id      = azurerm_network_interface.nic-ftp-001.id
  network_security_group_id = azurerm_network_security_group.nic-ftp-001-nsg.id
}

resource "azurerm_linux_virtual_machine" "vm-ftp-001" {
  name                = "vm-ftp-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ## 8$ par mois
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./terraform_azure_key_ssh/sec_azure_key.pub")
  }

  network_interface_ids = [
    azurerm_network_interface.nic-ftp-001.id
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# Network Interface for each VM survaillance-001
resource "azurerm_network_interface" "nic-surveillance-001" {
  name                = "nic-surveillance-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.snet-internal-003.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_surveillance_assoc" {
  network_interface_id      = azurerm_network_interface.nic-surveillance-001.id
  network_security_group_id = azurerm_network_security_group.nic-surveillance-001-nsg.id
}

# Virtual Machines
resource "azurerm_linux_virtual_machine" "vm-surveillance-001" {
  name                = "vm-surveillance-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ## 8$ par mois
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./terraform_azure_key_ssh/sec_azure_key.pub")
  }

  network_interface_ids = [azurerm_network_interface.nic-surveillance-001.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# Network Interface for each VM samba-001
resource "azurerm_network_interface" "nic-samba-001" {
  name                = "nic-samba-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.snet-internal-004.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_samba_assoc" {
  network_interface_id      = azurerm_network_interface.nic-samba-001.id
  network_security_group_id = azurerm_network_security_group.nic-samba-001-nsg.id
}

# Virtual Machines
resource "azurerm_linux_virtual_machine" "vm-samba-001" {
  name                = "vm-samba-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ## 8$ par mois
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./terraform_azure_key_ssh/sec_azure_key.pub")
  }

  network_interface_ids = [azurerm_network_interface.nic-samba-001.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# Network Interface for each VM backup-001
resource "azurerm_network_interface" "nic-backup-001" {
  name                = "nic-backup-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.snet-internal-005.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_backup_assoc" {
  network_interface_id      = azurerm_network_interface.nic-backup-001.id
  network_security_group_id = azurerm_network_security_group.nic-backup-001-nsg.id
}

# Virtual Machines
resource "azurerm_linux_virtual_machine" "vm-backup-001" {
  name                = "vm-backup-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ## 8$ par mois
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./terraform_azure_key_ssh/sec_azure_key.pub")
  }

  network_interface_ids = [azurerm_network_interface.nic-backup-001.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# Network Interface for each VM bastion-001
resource "azurerm_network_interface" "nic-bastion-001" {
  name                = "nic-bastion-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.snet-connectivity-001.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_bastion_assoc" {
  network_interface_id      = azurerm_network_interface.nic-bastion-001.id
  network_security_group_id = azurerm_network_security_group.nic-firewall-001-nsg.id
}

# Virtual Machines
resource "azurerm_linux_virtual_machine" "vm-bastion-001" {
  name                = "vm-bastion-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ## 8$ par mois
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./terraform_azure_key_ssh/sec_azure_key.pub")
  }

  network_interface_ids = [azurerm_network_interface.nic-bastion-001.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

# Network Interface for each VM firewall-001
resource "azurerm_network_interface" "nic-firewall-001" {
  name                = "nic-firewall-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.snet-connectivity-001.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_firewall_assoc" {
  network_interface_id      = azurerm_network_interface.nic-firewall-001.id
  network_security_group_id = azurerm_network_security_group.nic-firewall-001-nsg.id
}

# Virtual Machines
resource "azurerm_linux_virtual_machine" "vm-firewall-001" {
  name                = "vm-firewall-001"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  ## 8$ par mois
  size                            = "Standard_B1s"
  admin_username                  = "adminuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("./terraform_azure_key_ssh/sec_azure_key.pub")
  }

  network_interface_ids = [azurerm_network_interface.nic-firewall-001.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "thefreebsdfoundation"
    offer     = "freebsd-14_2"
    sku       = "14_2-release-amd64-gen2-ufs"
    version   = "latest"
  }
  plan {
    name      = "14_2-release-amd64-gen2-ufs"
    publisher = "thefreebsdfoundation"
    product   = "freebsd-14_2"
  }
}
