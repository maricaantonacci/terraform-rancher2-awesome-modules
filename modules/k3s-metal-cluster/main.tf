# Create a new rancher v2 K3S custom Cluster v2
resource "rancher2_cluster_v2" "k3s_cluster" {
  name = var.cluster_name
  fleet_namespace = "cattle-fleet-system"
  kubernetes_version = var.kubernetes_version
  enable_network_policy = var.enable_network_policy
  default_cluster_role_for_project_members = var.default_cluster_role_for_project_members
  agent_env_vars {
    name = "INSTALL_K3S_EXEC"
    value = "${var.agent_env_vars}"
}
rke_config {
  etcd {
   disable_snapshots = false
   snapshot_retention = 5
   snapshot_schedule_cron = "0 */5 * * *"
  }

machine_global_config = var.machine_global_config
chart_values = var.chart_values

upgrade_strategy {
  control_plane_concurrency =  "1"
  worker_concurrency =  "1"
}

}
}
