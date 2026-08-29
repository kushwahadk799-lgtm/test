variable "resource_groups" {
  description = "Resource Group configuration"

  type = map(object({
    name     = string
    location = string
  }))
}

variable "virtual_networks" {
  description = "Virtual Network configuration"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)

  }))
}

variable "subnets" {
  description = "Subnet configuration"

  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "network_security_groups" {
  description = "Network Security Group configuration"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "subnet_nsg_associations" {
  description = "Subnet NSG association configuration"

  type = map(object({
    subnet_id                 = string
    network_security_group_id = string
  }))
}