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