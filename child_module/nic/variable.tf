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