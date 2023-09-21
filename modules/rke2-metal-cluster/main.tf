# Create a new rancher v2 RKE2 custom Cluster v2
resource "rancher2_cluster_v2" "rke2_cluster" {
  name = "${var.cluster_name}"

  kubernetes_version = var.kubernetes_version
  enable_network_policy = var.enable_network_policy
  default_cluster_role_for_project_members = var.default_cluster_role_for_project_members

 rke_config {
    etcd {
        disable_snapshots = var.disable_snapshots
        snapshot_retention = var.snapshot_retention
        snapshot_schedule_cron = var.snapshot_schedule_cron
    }
    machine_global_config = var.machine_global_config
    chart_values = var.chart_values
    upgrade_strategy {
        control_plane_concurrency =  "1"
        worker_concurrency =  "1"
    }
    machine_selector_config{
        config = {cloud_provider_name: "none"}
    }
    registries {}
  }
}
