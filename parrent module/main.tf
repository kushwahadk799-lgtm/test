module "resource_group" {
  source = "../child_module/azurerm_resource_group"

  resource_groups = var.resource_groups
}