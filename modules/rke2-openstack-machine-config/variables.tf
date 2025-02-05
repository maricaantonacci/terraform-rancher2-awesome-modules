## Openstack Cloud variables
variable machine_config_name {
   type = string
   default = "node-config"
   description = "machine config name"
}
variable openstack_auth_url {
   type = string
   description = "openstack cloud api endpoint"
}
variable openstack_region { 
   type = string
   description = "Openstack region, normally this is set to default or RegionOne."
}
variable openstack_availability_zone { 
   type = string
   description = "Openstack availability zone, normally this is set to nova."
   default = "nova"
}
variable openstack_username {  
   type = string
   description = "Openstack username, you can find this in your openrc file"
   default = null
}
variable openstack_password { 
   type = string
   description = "Openstack user password"
   default = null
}
variable "openstack_application_credential_id" {
   type = string
   description = "Openstack application credential id"
   default = null  
}
variable "openstack_application_credential_secret" {
   type = string
   description = "Openstack  application credential secrets"
   default = null  
}
variable openstack_domain_id { 
   type = string
   description = "Openstack domain_id, normally this is set to default."
   default = "default"
}
variable openstack_tenant_id { 
   type = string
   description = "Openstack project/tenant_id, unique for each project."
}
variable openstack_flavor_id { 
   type = string
   description = "Openstack vm flavor, this will be the vm resources for your nodes, can be a list of flavors for each machine config"
}
variable openstack_image_id {  
   type = string
   description = "Openstack vm image , this will be the vm os image for your nodes, can be a list of images for each machine config"
}
variable openstack_net_name { 
   type = string
   description = "private network of the vm"
}
variable openstack_sec_groups { 
   type = string
   default = "default"
   description = " Openstack security groups, this security group will be used by the nodes. you can define a list as well."
}
variable openstack_boot_volume_size { 
   type = number
   default = 25
   description = "the root disk will be 25G by default. it is (mostly) ok."
}
variable "cloud_init_data" {
   type = string
   description = "user-input for cloud init"
}
variable openstack_keypair_name {
   type = string
   description = "the ssh key pair that will be injected to the VM"
}
variable private_key_file { # path to your public key.
   type = string
   description = "the ssh private key so that rancher can auth to the vms and run installation scripts"
}
variable ssh_user { # path to your public key.
   type = string
   description = "the ssh user that rancher can auth to the vms and run installation scripts"
}
variable ssh_port { # path to your public key.
   type = number
   default = 22
   description = "the ssh port, default to 22"
}
