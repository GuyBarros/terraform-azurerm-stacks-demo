module "storage_account" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "0.5.0"

  account_replication_type          = "LRS"
  location                          = var.location
  name                              = local.resource_names.storage_account_name
  resource_group_name               = local.resource_names.resource_group_name
  infrastructure_encryption_enabled = true

  # managed_identities = {
  #   system_assigned            = true
  #   user_assigned_resource_ids = [module.user_assigned_managed_identity.resource_id]
  # }

  # customer_managed_key = {
  #   key_vault_resource_id  = var.key_vault_resource_id
  #   key_name               = var.key_name
  #   # user_assigned_identity = { resource_id = module.user_assigned_managed_identity.resource_id }
  # }

  containers = {
    demo = {
      name                  = "demo"
      container_access_type = "private"
    }
  }

  private_endpoints = {
    primary = {
      private_dns_zone_resource_ids = [var.private_dns_zone_storage_account_id]
      subnet_resource_id            = var.private_endpoints_subnet_id
      subresource_name              = "blob"
      tags                          = var.tags
    }
  }

  diagnostic_settings_storage_account = local.diagnostic_settings
  diagnostic_settings_blob            = local.diagnostic_settings
  tags                                = var.tags
}
