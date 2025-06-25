

# component "resource_group" {
#   source = "./modules/resource-group"

#   inputs = {
#     location    = var.location
#     resource_group_name = var.resource_group_name
#   }

#   providers = {
#     azurerm = provider.azurerm.this
#   }
# }

component "part01-base" {
  source = "./modules/part01-base"

  inputs = {
    location    = var.location
    resource_group_name = var.resource_group_name
    tags = var.tags
  }

  providers = {
    azurerm = provider.azurerm.this
    random  = provider.random.this
    azapi   = provider.azapi.this
    modtm   = provider.modtm.this
  }
}

component "part02-virtual-network" {
 source  = "./modules/part02-virtual-network"
 

  inputs = {
    location    = var.location
    resource_group_name = component.part01-base.resource_group
    address_space = var.address_space
    subnets = var.subnets
    tags = var.tags
    log_analytics_workspace_id = component.part01-base.log_analytics_workspace_id
  }

 
  providers = {
    azurerm = provider.azurerm.this
    random  = provider.random.this
    azapi   = provider.azapi.this
    modtm   = provider.modtm.this
  }
}
component "part03-key-vault" {
  source = "./modules/part03-key-vault"

  inputs = {
    location    = var.location
    resource_group_name = component.part01-base.resource_group
    tags = var.tags
    log_analytics_workspace_id = component.part01-base.log_analytics_workspace_id
    virtual_network_id = component.part02-virtual-network.virtual_network_id
    private_endpoints_subnet_id = component.part02-virtual-network.private_endpoints_subnet_id
    key_administrator_id = var.key_administrator_id
  }

  providers = {
    azurerm = provider.azurerm.this
    random  = provider.random.this
    azapi   = provider.azapi.this
    modtm   = provider.modtm.this
    time  = provider.time.this
  }
}

component "part04-storage-account" {
  source = "./modules/part04-storage-account"

  inputs = {
    location    = var.location
    resource_group_name = component.part01-base.resource_group
    tags = var.tags
    log_analytics_workspace_id = component.part01-base.log_analytics_workspace_id
    virtual_network_id = component.part02-virtual-network.virtual_network_id
    private_endpoints_subnet_id = component.part02-virtual-network.private_endpoints_subnet_id
    key_vault_resource_id = component.part03-key-vault.key_vault_resource_id
   # key_name = component.part03-key-vault.key_name
    private_dns_zone_storage_account_id = component.part03-key-vault.private_dns_zone_storage_account_id
    virtual_machines_subnet_id = component.part02-virtual-network.virtual_machines_subnet_id


  }

  providers = {
    azurerm = provider.azurerm.this
    random  = provider.random.this
    azapi   = provider.azapi.this
    modtm   = provider.modtm.this
    http   = provider.http.this
  }
  
}