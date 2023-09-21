output "rancher_cluster_id" {
  value = rancher2_cluster_v2.rke2_cluster.id
}

output "cluster_name" {
  value = rancher2_cluster_v2.rke2_cluster.name
}

output "kubeconfig" {
  value = rancher2_cluster_v2.rke2_cluster.kube_config
}

output "cluster_node_command" {
  value = rancher2_cluster_v2.rke2_cluster.cluster_registration_token.*.node_command
  sensitive = true
}
