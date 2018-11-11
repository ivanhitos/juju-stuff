resource "azurerm_resource_group" "terraform_rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "juju_vnet" {
  name                = "Juju-VNet"
  address_space       = ["${var.vnet_cidr}"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.terraform_rg.name}"

  tags {
    group = "JujuGroup"
  }
}

resource "azurerm_subnet" "public_subnet" {
  name                 = "Public-Subnet"
  address_prefix       = "${var.public_subnet_cidr}"
  virtual_network_name = "${azurerm_virtual_network.juju_vnet.name}"
  resource_group_name  = "${azurerm_resource_group.terraform_rg.name}"
}
