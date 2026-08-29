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

data "azurerm_subnet" "subnet_data_block" {
  for_each = var.subnets

  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name

  depends_on = [module.subnets]
}

module "network_security_groups" {
  source                  = "../child_module/network_security_groups"
  network_security_groups = var.network_security_groups
  depends_on              = [module.subnets]
}

data "azurerm_network_security_group" "nsg" {
  for_each = var.network_security_groups

  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  depends_on = [module.network_security_groups]
}

module "subnet_nsg_associations" {
  source = "../child_module/subnet_nsg_associations"

  subnet_nsg_associations = {
    for key, value in var.subnet_nsg_associations : key => {
      subnet_id = data.azurerm_subnet.subnet_data_block[each.key].id

      network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
    }
  }

  depends_on = [module.subnets, module.network_security_groups]
}