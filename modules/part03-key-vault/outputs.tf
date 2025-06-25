output "resource_names" {
  value = local.resource_names
}

output "resource_ids" {
  value = {
  key_vault_resource_id  = module.key_vault.resource_id
  key_name               = reverse(split("/", module.key_vault.keys_resource_ids["cmk_for_storage_account"].versionless_id))[0]
  }
}


output "key_vault_resource_id" {
  value = module.key_vault.resource_id
}

output "key_name" {
  value = reverse(split("/", module.key_vault.keys_resource_ids["cmk_for_storage_account"].versionless_id))[0]
}

output "private_dns_zone_key_vault_id" {
  value = module.private_dns_zone_key_vault.resource_id
}

output "private_dns_zone_storage_account_id" {
  value = module.private_dns_zone_storage_account.resource_id
}