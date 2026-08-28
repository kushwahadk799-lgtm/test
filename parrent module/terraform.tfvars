resource_groups = {
  rg1 = {
    name     = "rg-terraform-demo"
    location = "East US"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet-terraform-demo"
    location            = "East US"
    resource_group_name = "rg-terraform-demo"
    address_space = ["10.0.0.0/16"]
  }
}