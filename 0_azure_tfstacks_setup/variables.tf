# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "subscription_id" {
  description = "the Azure subscription ID for the Azure Provider"
}

variable "tfc_azure_audience" {
  type        = string
  default     = "api://AzureADTokenExchange"
  description = "The audience value to use in run identity tokens"
}

variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with Azure"
}

variable "tfc_organization" {
  type = string
}

variable "tfc_project" {
  type = string
}

variable "tfc_stack" {
  type = string
}

variable "tfc_deployment" {
  type = set(string)
}

variable "tfc_varset_name" {
  type    = string
  default = "Azure Variables"
}
