module "user_assigned_managed_identity" {
  source  = "Azure/avm-res-managedidentity-userassignedidentity/azurerm"
  version = "0.3.3"

  location            = var.location
  name                = local.resource_names.user_assigned_managed_identity_name
  resource_group_name               = local.resource_names.resource_group_name
  tags                = var.tags
}
