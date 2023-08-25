output "k3s_cluster_id" {
  value = rancher2_cluster_v2.k3s_cluster.cluster_registration_token.*.cluster_id
}

output "cluster_name" {
  value = rancher2_cluster_v2.k3s_cluster.name
}

output "cluster_node_command" {
  value = rancher2_cluster_v2.k3s_cluster.cluster_registration_token.*.node_command
  sensitive = true
}

output "kubeconfig" {
  value = rancher2_cluster_v2.k3s_cluster.kube_config
}