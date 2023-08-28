variable "install_keepalived" {
   type = bool
}

variable "all_in_one" {
   type = bool
   description = "install keepalived"
}

variable "keepalived_vip" {
   type = string
}

variable "master_nodes_ips" {
   type = list
}

variable "worker_nodes_ips" {
   type = list
}

variable "cluster_node_command" {
   description = "Cluster Registration Command"
}

variable remote_sudoer {
}

variable private_key_file {
}

variable "wait_for" {
  type    = any
  default = []
}
