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
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "subnet-starlink"
    resource_group_name  = "rg-terraform-demo"
    virtual_network_name = "vnet-terraform-demo"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "subnet-streamflix"
    resource_group_name  = "rg-terraform-demo"
    virtual_network_name = "vnet-terraform-demo"
    address_prefixes     = ["10.0.2.0/24"]
  }

}



