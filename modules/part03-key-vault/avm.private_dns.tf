module "private_dns_zone_key_vault" {
  source  = "Azure/avm-res-network-privatednszone/azurerm"
  version = "0.3.2"

  resource_group_name = local.resource_names.resource_group_name
  domain_name         = "privatelink.vaultcore.azure.net"
  virtual_network_links = {
    vnetlink1 = {
      vnetlinkname = "key-vault"
      vnetid       = var.virtual_network_id
    }
  }

  tags = var.tags
}

module "private_dns_zone_storage_account" {
  source  = "Azure/avm-res-network-privatednszone/azurerm"
  version = "0.3.2"

  resource_group_name = local.resource_names.resource_group_name
  domain_name         = "privatelink.blob.core.windows.net"

  virtual_network_links = {
    vnetlink1 = {
      vnetlinkname = "storage-account"
      vnetid       = var.virtual_network_id
    }
  }

  tags = var.tags
}
