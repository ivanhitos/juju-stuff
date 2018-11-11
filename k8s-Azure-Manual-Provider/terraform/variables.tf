/* Configure Azure Provider and declare all the Variables that will be used in Terraform configurations */
provider "azurerm" {}

variable "subscription_id" {
  description = "Enter Subscription ID for provisioning resources in Azure"
}

variable "client_id" {
  description = "Enter Client ID for Application created in Azure AD"
}

variable "client_secret" {
  description = "Enter Client secret for Application in Azure AD"
}

variable "tenant_id" {
  description = "Enter Tenant ID / Directory ID of your Azure AD. Run Get-AzureSubscription to know your Tenant ID"
}

variable "location" {
  description = "The default Azure region for the resource provisioning"
}

variable "resource_group_name" {
  description = "Resource group name that will contain various resources"
}

variable "vnet_cidr" {
  description = "CIDR block for Virtual Network"
}

variable "public_subnet_cidr" {
  description = "CIDR block for Subnet within a Virtual Network"
}

variable "vm_username" {
  description = "Enter admin username to SSH into Linux VM"
}

variable "vm_userpublickey" {
  description = "Enter admin public key to SSH into VM"
}

variable "number_juju_machines" {
  description = "Number of Juju machines"
}

variable "juju_machines_type" {
  description = "Type of Juju machines"
}
