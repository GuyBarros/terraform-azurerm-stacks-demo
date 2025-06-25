output "resource_names" {
  value = local.resource_names
}

output "resource_ids" {
  value = {
    storage_account                = module.storage_account.resource_id
    user_assigned_managed_identity = module.user_assigned_managed_identity.resource_id
  }
}

