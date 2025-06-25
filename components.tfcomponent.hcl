

component "resource_group" {
  source = "./modules/resource-group"

  inputs = {
    location    = var.location
    resource_group_name = var.resource_group_name
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

component "part01-base" {
  source = "./modules/part01-base"

  inputs = {
    location    = var.location
    resource_group_name = component.resource_group.resource_group.name
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
    log_analytics_workspace_id = component.part01-base.resource_ids.log_analytics_workspace_id
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
    virtual_network_id = component.part02-virtual-network.virtual_network_id
    tags = var.tags
    log_analytics_workspace_id = component.part01-base.resource_ids.log_analytics_workspace_id
    virtual_network_id = component.part02-virtual-network.module.virtual_network.resource_id
    private_endpoints_subnet_id = component.part02-virtual-network.virtual_network.subnets["private_endpoints"].resource_id
  }

  providers = {
    azurerm = provider.azurerm.this
    random  = provider.random.this
    azapi   = provider.azapi.this
    modtm   = provider.modtm.this
    time  = provider.time.this
  }
}