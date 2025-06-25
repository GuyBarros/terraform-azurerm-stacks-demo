output "resource_names" {
  value = local.resource_names
}

output "log_analytics_workspace_id" {
  value =  module.log_analytics_workspace.resource_id
}

output "resource_group" {
  value =  module.resource_group.name
}