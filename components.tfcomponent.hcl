

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

# component "compute_scale_set" {
# source  = "Azure/avm-res-compute-virtualmachinescaleset/azurerm"
#   version = "0.7.1"
#   inputs = {
#     location    = var.location
#     resource_group_name = component.resource_group.outputs.resource_group.name
#     name = var.scale_set_name
#      extension_protected_setting = {}
#     user_data_base64 = null
#   }

#   providers = {
#     azurerm = provider.azurerm.this
#     random  = provider.random.this
#     modtm   = provider.modtm.this
# }

# }