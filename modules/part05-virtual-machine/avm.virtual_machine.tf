module "virtual_machine" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = "0.18.0"

  resource_group_name               = local.resource_names.resource_group_name
  os_type                    = "linux"
  name                       = local.resource_names.virtual_machine_name
  sku_size                   = "Standard_B1s"
  location                   = var.location
  zone                       = "1"
  
  generated_secrets_key_vault_secret_config = {
    key_vault_resource_id = var.key_vault_resource_id
  }

  managed_identities = {
    system_assigned = true
  }

  source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  network_interfaces = {
    private = {
      name = local.resource_names.network_interface_name
      ip_configurations = {
        private = {
          name                          = "private"
          private_ip_subnet_resource_id = var.virtual_machines_subnet_id
        }
      }
    }
  }

  diagnostic_settings = local.diagnostic_settings
  tags                = var.tags

  
}

