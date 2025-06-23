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
