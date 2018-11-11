output "juju_machine_private_ip" {
  description = "private ip addresses of the Juju machines:"
  value       = "${azurerm_network_interface.juju_machine_nic.*.private_ip_address}"
}

output "juju_controller_private_ip" {
  description = "private ip addresses of the Juju Controller:"
  value       = "${azurerm_network_interface.juju_controller_nic.private_ip_address}"
}

output "juju_client_private_ip" {
  description = "private ip addresses of the Juju client:"
  value       = "${azurerm_network_interface.juju_client_nic.private_ip_address}"
}

output "juju_client_public_ip" {
  description = "public ip addresses of the Juju client:"
  value       = "${azurerm_public_ip.juju_client_pip.ip_address}"
}
