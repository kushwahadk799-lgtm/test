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