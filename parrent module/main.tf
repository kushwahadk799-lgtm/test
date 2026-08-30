module "resource_group" {
  source = "../child_module/azurerm_resource_group"

  resource_groups = var.resource_groups
}

module "virtual_networks" {
  source = "../child_module/virtual_networks"

  virtual_networks = var.virtual_networks

  depends_on = [
    module.resource_group
  ]
}

module "subnets" {
  source = "../child_module/subnets"

  subnets = var.subnets

  depends_on = [
  module.virtual_networks]
}

module "network_security_groups" {
  source = "../child_module/network_security_groups"

  network_security_groups = var.network_security_groups

  depends_on = [
    module.resource_group
  ]
}

module "subnet_nsg_associations" {
  source = "../child_module/subnet_nsg_associations"

  subnet_name                 = var.subnet_name
  virtual_network_name        = var.virtual_network_name
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name

  depends_on = [
    module.subnets,
    module.network_security_groups
  ]
}

module "nic" {
  source = "../child_module/nic"

  virtual_machine = var.virtual_machine

  depends_on = [
    module.subnet_nsg_associations 
  ]
}