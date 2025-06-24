########## WIF Integration Variables ##########
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

######## Component Resource Group Variables ########
# shared with part01-base 

######### Component Part01-base Variables #########
variable "location" {
  type        = string
  description = "Azure location name"
}

variable "resource_group_name" {
  description = "List of resource group names to create"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
}


############ Component Part02-virtual-network Variables #########
# This component is used to create a virtual network and subnets in Azure.

variable "resource_name_workload" {
  type        = string
  description = "The name segment for the workload"
  default     = "demo"
 
}

variable "resource_name_environment" {
  type        = string
  description = "The name segment for the environment"
  default     = "dev"
 
}

variable "resource_name_sequence_start" {
  type        = number
  description = "The number to use for the resource names"
  default     = 1
 
}
variable "resource_name_templates" {
  type        = map(string)
  description = "A map of resource names to use"
  default = {
    resource_group_name          = "rg-$${workload}-$${environment}-$${location}-$${sequence}"
    log_analytics_workspace_name = "law-$${workload}-$${environment}-$${location}-$${sequence}"
    virtual_network_name         = "vnet-$${workload}-$${environment}-$${location}-$${sequence}"
    network_security_group_name  = "nsg-$${workload}-$${environment}-$${location}-$${sequence}"
    nat_gateway_name             = "nat-$${workload}-$${environment}-$${location}-$${sequence}"
    nat_gateway_public_ip_name   = "pip-nat-$${workload}-$${environment}-$${location}-$${sequence}"
  }
}

variable "address_space" {
  type        = string
  description = "The address space that is used the virtual network"
}

variable "subnets" {
  type = map(object({
    size                       = number
    has_nat_gateway            = bool
    has_network_security_group = bool
  }))
  description = "The subnets"
}
