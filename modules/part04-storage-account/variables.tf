variable "location" {
  type        = string
  description = "The location/region where the resources will be created. Must be in the short form (e.g. 'uksouth')"
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.location))
    error_message = "The location must only contain lowercase letters, numbers, and hyphens"
  }
  validation {
    condition     = length(var.location) <= 20
    error_message = "The location must be 20 characters or less"
  }
}

variable "resource_name_location_short" {
  type        = string
  description = "The short name segment for the location"
  default     = ""
  validation {
    condition     = length(var.resource_name_location_short) == 0 || can(regex("^[a-z]+$", var.resource_name_location_short))
    error_message = "The short name segment for the location must only contain lowercase letters"
  }
  validation {
    condition     = length(var.resource_name_location_short) <= 3
    error_message = "The short name segment for the location must be 3 characters or less"
  }
}

variable "resource_name_workload" {
  type        = string
  description = "The name segment for the workload"
  default     = "demo"
  validation {
    condition     = can(regex("^[a-z0-9]+$", var.resource_name_workload))
    error_message = "The name segment for the workload must only contain lowercase letters and numbers"
  }
  validation {
    condition     = length(var.resource_name_workload) <= 4
    error_message = "The name segment for the workload must be 4 characters or less"
  }
}

variable "resource_name_environment" {
  type        = string
  description = "The name segment for the environment"
  default     = "dev"
  validation {
    condition     = can(regex("^[a-z0-9]+$", var.resource_name_environment))
    error_message = "The name segment for the environment must only contain lowercase letters and numbers"
  }
  validation {
    condition     = length(var.resource_name_environment) <= 4
    error_message = "The name segment for the environment must be 4 characters or less"
  }
}

variable "resource_name_sequence_start" {
  type        = number
  description = "The number to use for the resource names"
  default     = 1
  validation {
    condition     = var.resource_name_sequence_start >= 1 && var.resource_name_sequence_start <= 999
    error_message = "The number must be between 1 and 999"
  }
}

variable "resource_name_templates" {
  type        = map(string)
  description = "A map of resource names to use"
  default = {
    resource_group_name                 = "rg-$${workload}-$${environment}-$${location}-$${sequence}"
    log_analytics_workspace_name        = "law-$${workload}-$${environment}-$${location}-$${sequence}"
    virtual_network_name                = "vnet-$${workload}-$${environment}-$${location}-$${sequence}"
    network_security_group_name         = "nsg-$${workload}-$${environment}-$${location}-$${sequence}"
    nat_gateway_name                    = "nat-$${workload}-$${environment}-$${location}-$${sequence}"
    nat_gateway_public_ip_name          = "pip-nat-$${workload}-$${environment}-$${location}-$${sequence}"
    key_vault_name                      = "kv$${workload}$${environment}$${location_short}$${sequence}$${uniqueness}"
    storage_account_name                = "sto$${workload}$${environment}$${location_short}$${sequence}$${uniqueness}"
    user_assigned_managed_identity_name = "uami-$${workload}-$${environment}-$${location}-$${sequence}"
  }
}


variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "The resource ID of the Log Analytics workspace to use for monitoring"

}

variable "virtual_network_id"{
  type        = string
  description = "The resource ID of the virtual network to use for the subnets"
}

variable "private_endpoints_subnet_id" {
  type        = string
  description = "The resource ID of the subnet to use for the private endpoints"
}

variable "key_vault_resource_id" {
  type        = string
  description = "The resource ID of the Key Vault to use for the storage account secrets"
  }

# variable "key_name" {
#   type        = string
#   description = "The name of the key to use for the storage account secrets"
# }

variable "private_dns_zone_storage_account_id" {
  type        = string
  description = "The resource ID of the private DNS zone for the storage account"
}
