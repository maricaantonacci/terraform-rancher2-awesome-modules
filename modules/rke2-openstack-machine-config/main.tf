# Create openstack machine config v2
resource "rancher2_machine_config_v2" "machine" {
  generate_name       = var.machine_config_name
  openstack_config {
    auth_url          = var.openstack_auth_url
    region            = var.openstack_region
    availability_zone = var.openstack_availability_zone
    username          = var.openstack_username
    password          = var.openstack_password
    domain_id         = var.openstack_domain_id
    tenant_id         = var.openstack_tenant_id
    flavor_id         = var.openstack_flavor_id
    image_id          = var.openstack_image_id
    keypair_name      = var.openstack_keypair_name
    net_name          = var.openstack_net_name
    sec_groups        = var.openstack_sec_groups
    ssh_user          = var.ssh_user
    ssh_port          = var.ssh_port
    boot_from_volume  = true
    volume_size       = var.openstack_boot_volume_size
    private_key_file  = var.private_key_file
    insecure          = true
    user_data_file    = var.cloud_init_data
    application_credential_id = var.openstack_application_credential_id
    application_credential_secret = var.openstack_application_credential_secret
  }
}

output "machine_config_kind" {
  value = rancher2_machine_config_v2.machine.kind
}
output "machine_config_name" {
  value = rancher2_machine_config_v2.machine.name
}


