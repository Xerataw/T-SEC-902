output "connectivity_vm_public_ip" {
  value = azurerm_public_ip.connectivity_ip.ip_address
}

output "vm-web-private_ip" {
  value = azurerm_network_interface.nic-site-web-001.private_ip_address
}

output "vm-ftp-private_ip" {
  value = azurerm_network_interface.nic-ftp-001.private_ip_address
}

output "vm-surveillance-private_ip" {
  value = azurerm_network_interface.nic-surveillance-001.private_ip_address
}

output "vm-bastion-private_ip" {
  value = azurerm_network_interface.nic-bastion-001.private_ip_address
}

output "vm-firewall-private_ip" {
  value = azurerm_network_interface.nic-firewall-001.private_ip_address
}

output "vm-backup-private_ip" {
  value = azurerm_network_interface.nic-backup-001.private_ip_address
}
