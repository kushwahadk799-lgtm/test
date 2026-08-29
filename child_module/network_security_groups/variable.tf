variable "network_security_groups" {
  description = "Network Security Group configuration"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}