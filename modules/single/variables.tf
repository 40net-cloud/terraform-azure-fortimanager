##############################################################################################################
#
# FortiManager - a standalone FortiManager VM
# Terraform deployment template for Microsoft Azure
#
##############################################################################################################
# Variables
##############################################################################################################

variable "prefix" {
  description = "Added name to each deployed resource"
}

variable "location" {
  description = "Azure region"
}

variable "username" {
}

variable "password" {
}

##############################################################################################################
# Names and data sources of linked Azure resource
##############################################################################################################

variable "resource_group_name" {
}

variable "virtual_network_name" {
  description = ""
}

data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

variable "subnet_name" {
  description = ""
}

data "azurerm_subnet" "subnet1" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
}

##############################################################################################################
# FortiManager
##############################################################################################################

variable "fmg_version" {
  description = "FortiManager version by default the 'latest' available version in the Azure Marketplace is selected"
  default     = "latest"
}

variable "fmg_byol_license_file" {
  default = ""
}

variable "fmg_byol_fortiflex_license_token" {
  default = ""
}

variable "fmg_ssh_public_key_file" {
  default = ""
}

variable "fmg_vmsize" {
  default = "Standard_D2s_v3"
}

variable "fmg_datadisk_size_gb" {
  default = 50
}

variable "fmg_storage_account_type" {
  default = "Standard_LRS"
}

variable fmg_datadisk_count {
  default = 1
}

variable "fmg_accelerated_networking" {
  description = "Enables Accelerated Networking for the network interfaces of the FortiManager"
  default     = "true"
}

variable "fmg_source_image_id" {
  description = "Reference a your own FortiManager image instead of one from the Azure Marketplace"
  default     = null
}

variable "fortinet_tags" {
  type = map(string)
  default = {
    publisher : "Fortinet",
    template : "FortiManager-single",
    provider : "6EB3B02F-50E5-4A3E-8CB8-2E1292583FMG"
  }
}

##############################################################################################################
