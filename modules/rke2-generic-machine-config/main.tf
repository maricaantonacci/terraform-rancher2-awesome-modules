resource "local_file" "keepalived_config" {
  depends_on = [
    var.wait_for
  ]
  content     = templatefile("${path.module}/ansible/templates/keepalived.conf.tpl",
    {
      keepalived_vip = var.keepalived_vip
    })
  filename    = "${path.cwd}/ansible/keepalived.conf.j2"
}


resource "local_file" "ansible_inventory" {
  depends_on = [
    var.wait_for
  ]
  content     = templatefile("${path.module}/ansible/templates/inventory.tpl", 
    { 
      master_nodes_ips = var.master_nodes_ips
      worker_nodes_ips = var.worker_nodes_ips
    })
  filename    = "${path.cwd}/ansible/inventory"
}

resource "local_file" "ansible_config" {
  
  content     = templatefile("${path.module}/ansible/templates/ansible.tpl", 
    { 
      remote_sudoer = var.remote_sudoer
      private_key_file = var.private_key_file
    })
  filename    = "${path.cwd}/ansible/ansible.cfg"
}

resource "local_file" "ansible_playbook" {

  content     = templatefile("${path.module}/ansible/templates/playbook.tpl", 
    {
      install_keepalived = var.install_keepalived
      cluster_node_command = var.cluster_node_command[0]
      all_in_one = var.all_in_one
    })
  filename    = "${path.cwd}/ansible/playbook.yml"

  provisioner "local-exec" {
    working_dir = "${path.cwd}/ansible"
    command     = "ansible-playbook -i inventory playbook.yml"
  }

}
