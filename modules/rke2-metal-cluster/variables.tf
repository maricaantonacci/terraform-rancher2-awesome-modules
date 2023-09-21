variable "cluster_name" {
   type = string
   description = "name of the rke cluster"
}
variable "kubernetes_version" {
   type = string
   description = "kubernetes version of the rke cluster"
}
variable "enable_network_policy" {
   type = bool
   default = true
   description = "Option to enable or disable Project Network Isolation, defaults to true"
}
variable "default_cluster_role_for_project_members" {
   type = string
   default = "user"
   description = "default cluster role for new project members, defaults to user"
}
# Path to the machine_global_config.yaml file
variable "machine_global_config" {
  type        = string
  description = "Path to the machine_global_config.yaml file"
}
variable chart_values {
   type = string
   description = "rke provided helm charts chart values"
}
# Environment variables for the agent
variable "agent_env_vars_name" {
  type        = string
  default     = ""
  description = "Environment variables for the agent"
}
variable "agent_env_vars_value" {
  type        = string
  default     = ""
  description = "Environment variables for the agent"
}
variable "control_plane_concurrency" {
   type = string
   default = "1"
}
variable "worker_concurrency" {
   type = string
   default = "1"
}
variable "disable_snapshots" {
   type = bool
   default = false
}
variable "snapshot_retention" {
   type = number
   default = 5
}
variable "snapshot_schedule_cron" {
   type = string
   default = "0 */5 * * *"
}
