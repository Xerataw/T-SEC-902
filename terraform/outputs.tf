output "connectivity_vm_public_ip" {
  value = azurerm_public_ip.connectivity_ip.ip_address
  description = "Adresse IP publique de la VM de connectivité"
}

output "vm_web_private_ip" {
  value = azurerm_linux_virtual_machine.vm-site-web-001.private_ip_address
  description = "Adresse IP privée de la VM Web"
}

output "vm_ftp_private_ip" {
  value = azurerm_linux_virtual_machine.vm-ftp-001.private_ip_address
  description = "Adresse IP privée de la VM FTP"
}

output "vm_surveillance_private_ip" {
  value = azurerm_linux_virtual_machine.vm-surveillance-001.private_ip_address
  description = "Adresse IP privée de la VM Surveillance"
}

output "vm_bastion_private_ip" {
  value = azurerm_linux_virtual_machine.vm-bastion-001.private_ip_address
  description = "Adresse IP privée de la VM Bastion"
}
