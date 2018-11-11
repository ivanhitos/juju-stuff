resource "azurerm_public_ip" "juju_client_pip" {
  name                         = "Juju_client_PIP"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.terraform_rg.name}"
  public_ip_address_allocation = "static"

  tags {
    group = "JujuGroup"
  }
}

resource "azurerm_network_interface" "juju_client_nic" {
  name                      = "JujuClientNic"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.terraform_rg.name}"
  network_security_group_id = "${azurerm_network_security_group.juju_client_sg.id}"

  ip_configuration {
    name                          = "IP_Juju_Client_Private"
    subnet_id                     = "${azurerm_subnet.public_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.juju_client_pip.id}"
  }

  tags {
    group = "JujuGroup"
  }
}

resource "azurerm_public_ip" "juju_controller_pip" {
  name                         = "JujuControllerPip"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.terraform_rg.name}"
  public_ip_address_allocation = "static"

  tags {
    group = "JujuGroup"
  }
}

resource "azurerm_network_interface" "juju_controller_nic" {
  name                      = "JujuControllerNic"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.terraform_rg.name}"
  network_security_group_id = "${azurerm_network_security_group.juju_controller_sg.id}"

  ip_configuration {
    name                          = "IP_Juju_Controller_Private"
    subnet_id                     = "${azurerm_subnet.public_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.juju_controller_pip.id}"
  }

  tags {
    group = "JujuGroup"
  }
}




resource "azurerm_public_ip" "juju_machine_pip" {
  name                         = "JujuMachinePip${count.index}"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.terraform_rg.name}"
  public_ip_address_allocation = "dynamic"
  count                        = "${var.number_juju_machines}"


  tags {
    group = "JujuGroup"
  }
}

resource "azurerm_network_interface" "juju_machine_nic" {
  name                      = "JujuMachineNic${count.index}"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.terraform_rg.name}"
  network_security_group_id = "${azurerm_network_security_group.juju_machine_sg.id}"
  count                     = "${var.number_juju_machines}"

  ip_configuration {
    name                          = "IP_Juju_Machine_Private_${count.index}"
    subnet_id                     = "${azurerm_subnet.public_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${element(azurerm_public_ip.juju_machine_pip.*.id, count.index)}"

  }

  tags {
    group = "JujuGroup"
  }
}





