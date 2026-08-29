variable "subnet_nsg_associations" {
  description = "Subnet NSG association configuration"

  type = map(object({
    subnet_id                 = string
    network_security_group_id = string
  }))
}