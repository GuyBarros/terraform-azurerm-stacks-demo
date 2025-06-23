variable "location" {
  description = "Azure region where the resources will be created"
  type        = string
  default     = "West Europe"
}


variable "resource_group_name" {
  description = "List of resource group names to create"
  type        = string
}

