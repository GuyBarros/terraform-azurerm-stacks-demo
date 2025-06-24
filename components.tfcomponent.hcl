

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

# component "virtual_network" {
#  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
#  version = "0.8.1"

#   inputs = {
#     location    = var.location
#     resource_group_name = component.resource_group.outputs.resource_group.name
#     address_space = var.address_space
#     subnets = var.subnets
#   }

#   providers = {
#     azurerm = provider.azurerm.this
#     random  = provider.random.this
#     azapi   = provider.azapi.this
#     modtm   = provider.modtm.this
#   }
# }

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