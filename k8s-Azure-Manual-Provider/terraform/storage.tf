resource "azurerm_storage_account" "jujustoragetest55" {
  name                     = "jujustoragetest55"
  resource_group_name      = "${azurerm_resource_group.terraform_rg.name}"
  location                 = "${var.location}"
  account_replication_type = "LRS"
  account_tier             = "Standard"

  tags {
    group = "JujuGroup"
  }
}

resource "azurerm_storage_container" "juju_cont" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.terraform_rg.name}"
  storage_account_name  = "${azurerm_storage_account.jujustoragetest55.name}"
  container_access_type = "private"
}
