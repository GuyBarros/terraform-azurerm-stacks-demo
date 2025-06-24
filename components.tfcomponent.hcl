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

component "virtual_network" {
 source  = "Azure/avm-res-network-virtualnetwork/azurerm"
 version = "0.8.1"

  inputs = {
    location    = var.location
    resource_group_name = component.resource_group.outputs.resource_group.name
    address_space = var.address_space
    subnets = var.subnets
  }

  providers = {
    azurerm = provider.azurerm.this
    random  = provider.random.this
    azapi   = provider.azapi.this
    modtm   = provider.modtm.this
  }
}
