# Name of the Rancher cluster
variable "cluster_name" {
  type        = string
  description = "Name of the K3s cluster"
  default     = "my-cluster" # You can set your desired default value
}

# Kubernetes version for the cluster
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version for the cluster"
}

# Environment variables for the agent
variable "agent_env_vars" {
  type        = string
  description = "Environment variables for the agent"
}

variable enable_network_policy {
   type = bool
   default = true
   description = "Option to enable or disable Project Network Isolation. Defaults to true"
}

# Path to the machine_global_config.yaml file
variable "machine_global_config" {
  type        = string
  description = "Path to the machine_global_config.yaml file"
}

# Path to the machine_global_config.yaml file 
variable "chart_values" {
  type        = string
  description = "Path to the chart_values.yaml file"
}

variable "default_cluster_role_for_project_members" {
  type = string
  description = "default cluster role in rancher ccm to assing new users"
  default = "user"
}