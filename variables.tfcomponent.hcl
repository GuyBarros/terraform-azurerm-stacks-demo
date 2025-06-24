variable "location" {
  type        = string
  description = "Azure location name"
}

variable "resource_group_name" {
  description = "List of resource group names to create"
  type        = string
}
variable "identity_token" {
  type        = string
  ephemeral   = true
  description = "Identity token for provider authentication"
}

variable "client_id" {
  type        = string
  description = "Azure app registration client ID"
  ephemeral = true
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
  ephemeral = true
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
  ephemeral = true
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = list(string)
}

variable "subnets" {
  type = map(object({
    address_prefix   = optional(string)
    address_prefixes = optional(list(string))
    name             = string
    nat_gateway = optional(object({
      id = string
    }))
    network_security_group = optional(object({
      id = string
    }))
    private_endpoint_network_policies             = optional(string, "Enabled")
    private_link_service_network_policies_enabled = optional(bool, true)
    route_table = optional(object({
      id = string
    }))
    service_endpoint_policies = optional(map(object({
      id = string
    })))
    service_endpoints               = optional(set(string))
    default_outbound_access_enabled = optional(bool, false)
    sharing_scope                   = optional(string, null)
    delegation = optional(list(object({
      name = string
      service_delegation = object({
        name = string
      })
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })))
  }))
  default     = {}
  description = <<DESCRIPTION
(Optional) A map of subnets to create

 - `address_prefix` - (Optional) The address prefix to use for the subnet. One of `address_prefix` or `address_prefixes` must be specified.
 - `address_prefixes` - (Optional) The address prefixes to use for the subnet. One of `address_prefix` or `address_prefixes` must be specified.
 - `enforce_private_link_endpoint_network_policies` - 
 - `enforce_private_link_service_network_policies` - 
 - `name` - (Required) The name of the subnet. Changing this forces a new resource to be created.
 - `default_outbound_access_enabled` - (Optional) Whether to allow internet access from the subnet. Defaults to `false`.
 - `private_endpoint_network_policies` - (Optional) Enable or Disable network policies for the private endpoint on the subnet. Possible values are `Disabled`, `Enabled`, `NetworkSecurityGroupEnabled` and `RouteTableEnabled`. Defaults to `Enabled`.
 - `private_link_service_network_policies_enabled` - (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to `true` will **Enable** the policy and setting this to `false` will **Disable** the policy. Defaults to `true`.
 - `service_endpoint_policies` - (Optional) The map of objects with IDs of Service Endpoint Policies to associate with the subnet.
 - `service_endpoints` - (Optional) The list of Service endpoints to associate with the subnet. Possible values include: `Microsoft.AzureActiveDirectory`, `Microsoft.AzureCosmosDB`, `Microsoft.ContainerRegistry`, `Microsoft.EventHub`, `Microsoft.KeyVault`, `Microsoft.ServiceBus`, `Microsoft.Sql`, `Microsoft.Storage`, `Microsoft.Storage.Global` and `Microsoft.Web`.

 ---
 `delegation` supports the following:
 - `name` - (Required) A name for this delegation.

 ---
 `nat_gateway` supports the following:
 - `id` - (Optional) The ID of the NAT Gateway which should be associated with the Subnet. Changing this forces a new resource to be created.

 ---
 `network_security_group` supports the following:
 - `id` - (Optional) The ID of the Network Security Group which should be associated with the Subnet. Changing this forces a new association to be created.

 ---
 `route_table` supports the following:
 - `id` - (Optional) The ID of the Route Table which should be associated with the Subnet. Changing this forces a new association to be created.

 ---
 `timeouts` supports the following:
 - `create` - (Defaults to 30 minutes) Used when creating the Subnet.
 - `delete` - (Defaults to 30 minutes) Used when deleting the Subnet.
 - `read` - (Defaults to 5 minutes) Used when retrieving the Subnet.
 - `update` - (Defaults to 30 minutes) Used when updating the Subnet.

 ---
 `role_assignments` supports the following:

 - `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
 - `principal_id` - The ID of the principal to assign the role to.
 - `description` - (Optional) The description of the role assignment.
 - `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
 - `condition` - (Optional) The condition which will be used to scope the role assignment.
 - `condition_version` - (Optional) The version of the condition syntax. Leave as `null` if you are not using a condition, if you are then valid values are '2.0'.
 - `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.
 - `principal_type` - (Optional) The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.
 
DESCRIPTION

}