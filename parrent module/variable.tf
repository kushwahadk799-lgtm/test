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
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name_name = string
    virtual_network_name = string
    resource_group_name = string
    network_security_group_name = string

  }))
}

variable "virtual_machine" {
  type = map(object({
    vm_name               = string
    location              = string
    resource_group_name   = string
    subnet_name           = string
    virtual_network_name  = string
    nic_name              = string
    public_ip_name        = string
    ip_configuration_name = string
  }))
}