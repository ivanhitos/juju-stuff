resource "azurerm_virtual_machine" "juju_client" {
  name                  = "juju_client_vm"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.terraform_rg.name}"
  network_interface_ids = ["${azurerm_network_interface.juju_client_nic.id}"]
  vm_size               = "Standard_B1ms"

  #This will delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "osdisk-jujuclient"
    vhd_uri       = "${azurerm_storage_account.jujustoragetest55.primary_blob_endpoint}${azurerm_storage_container.juju_cont.name}/osdisk-jujuclient.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "juju-client"
    admin_username = "${var.vm_username}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.vm_username}/.ssh/authorized_keys"
      key_data = "${var.vm_userpublickey}"
    }
  }

  tags {
    group = "JujuGroup"
  }
}

resource "azurerm_virtual_machine" "juju_controller" {
  name                  = "juju_controller_vm"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.terraform_rg.name}"
  network_interface_ids = ["${azurerm_network_interface.juju_controller_nic.id}"]
  vm_size               = "Standard_B2ms"

  #This will delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "osdisk-jujucontroller"
    vhd_uri       = "${azurerm_storage_account.jujustoragetest55.primary_blob_endpoint}${azurerm_storage_container.juju_cont.name}/osdisk-jujucontroller.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "juju-controller"
    admin_username = "${var.vm_username}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.vm_username}/.ssh/authorized_keys"
      key_data = "${var.vm_userpublickey}"
    }
  }

  tags {
    group = "JujuGroup"
  }
}



resource "azurerm_virtual_machine" "juju_machine" {
  name                  = "juju_machine_vm_${count.index}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.terraform_rg.name}"
  network_interface_ids = ["${element(azurerm_network_interface.juju_machine_nic.*.id, count.index)}"]
  vm_size               = "${var.juju_machines_type}"
  count                 = "${var.number_juju_machines}"

  #This will delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "osdisk-jujumachine-${count.index}"
    vhd_uri       = "${azurerm_storage_account.jujustoragetest55.primary_blob_endpoint}${azurerm_storage_container.juju_cont.name}/osdisk-jujumachine-${count.index}.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "juju-machine-${count.index}"
    admin_username = "${var.vm_username}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.vm_username}/.ssh/authorized_keys"
      key_data = "${var.vm_userpublickey}"
    }
  }

  tags {
    group = "JujuGroup"
  }
}




