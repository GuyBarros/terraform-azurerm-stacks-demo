output "resource_names" {
  value = local.resource_names
}

output "resource_ids" {
  value = {
    key_vault               = module.key_vault.resource_id
  }
}

