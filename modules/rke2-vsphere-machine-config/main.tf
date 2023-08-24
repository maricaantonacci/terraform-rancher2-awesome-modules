data "rancher2_cloud_credential" "cloud_credential_name" {
    name = var.cloud_credential_name
}

# Create vsphere machine config v2
resource "rancher2_machine_config_v2" "machine" {
  generate_name              = var.machine_config_name
  vsphere_config {
    datacenter               = var.vsphere_datacenter
    datastore                = var.vsphere_datastore
    boot2docker_url          = var.vsphere_boot2docker_url
    clone_from               = var.vsphere_virtual_machine_template
    cfgparam                 = var.vsphere_cfgparam
    cloud_config             = var.cloud_init_data
    creation_type            = var.vsphere_virtual_machine_creation_type
    folder                   = var.vsphere_folder
    pool                     = var.vsphere_resource_pool
    
    cpu_count                = var.vm_num_cpus
    disk_size                = var.vm_disk_size
    memory_size              = var.vm_memory
    network                  = var.vm_network
#    ssh_user                 = var.ssh_user
#    ssh_user_group           = var.ssh_user_group
#    ssh_port                 = var.ssh_port
#    ssh_password             = var.ssh_password
  }
}


