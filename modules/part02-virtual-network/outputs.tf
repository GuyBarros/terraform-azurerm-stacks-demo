
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
