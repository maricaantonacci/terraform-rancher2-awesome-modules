output "rancher_cluster_id" {
  value = rancher2_cluster_v2.rke2_cluster.id
}

output "cluster_name" {
  value = rancher2_cluster_v2.rke2_cluster.name
}

output "kubeconfig" {
  value = rancher2_cluster_v2.rke2_cluster.kube_config
}

output "nodepool_instance_ids" {
  value = [for np in rancher2_cluster_v2.rke2_cluster.nodepools : np.id]
  description = "List of instance IDs for each nodepool"
}
