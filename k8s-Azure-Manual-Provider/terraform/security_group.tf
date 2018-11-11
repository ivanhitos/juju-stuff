resource "azurerm_network_security_group" "juju_client_sg" {
  name                = "juju_client_sg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowAllinSubnet"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "${var.public_subnet_cidr}"
    destination_address_prefix = "*"
  }

  tags {
    group = "JujuGroup"
  }
}

resource "azurerm_network_security_group" "juju_controller_sg" {
  name                = "juju_controller_sg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowAllinSubnet"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "${var.public_subnet_cidr}"
    destination_address_prefix = "*"
  }

  tags {
    group = "JujuGroup"
  }
}



resource "azurerm_network_security_group" "juju_machine_sg" {
  name                = "juju_machine_sg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowAllinSubnet"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "${var.public_subnet_cidr}"
    destination_address_prefix = "*"
  }

  tags {
    group = "JujuGroup"
  }
}