variable "location" {
  type        = string
  description = "Azure location name"
}

variable "name_suffix" {
  type        = string
  description = "Name suffix for resource names"
}

variable "identity_token" {
  type        = string
  ephemeral   = true
  description = "Identity token for provider authentication"
}

variable "client_id" {
  type        = string
  description = "Azure app registration client ID"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
}
