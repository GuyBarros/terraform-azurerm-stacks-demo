output "resource_names" {
  value = local.resource_names
}

output "resource_ids" {
  value = {
    virtual_network         = module.virtual_network.resource_id
    network_security_group  = module.network_security_group.resource_id
    nat_gateway             = module.nat_gateway.resource_id
    nat_gateway_public_ip   = module.nat_gateway.public_ip_resource["default"].id
  }
}

output "virtual_network_id" {
  value = module.virtual_network.resource_id
}

output "subnets" {
  value = module.virtual_network.subnets
}

output "private_endpoints_subnet_id" {
  value = module.virtual_network.subnets["private_endpoints"].resource_id
}

output "virtual_machines_subnet_id" {
  value = module.virtual_network.subnets["virtual_machines"].resource_id
}

output "azure_bastion_subnet_id" {
  value = module.virtual_network.subnets["AzureBastionSubnet"].resource_id
}
