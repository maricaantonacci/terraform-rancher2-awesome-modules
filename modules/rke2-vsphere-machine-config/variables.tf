variable "cloud_credential_name" {
  description = "vSphere/vCenter credential name in Rancher Cluster Manager."
  type = string
}

variable "machine_config_name" {
  description = "The generated name for the machine config"
  default = "node-config"
  type = string
}

variable "vsphere_datacenter" {
  description = "Name of the vSphere datacenter (Optional)"
  default = ""
  type = string
}

variable "vsphere_datastore" {
  description = "Name of the vSphere datastore (Optional)"
  default = ""
  type = string
}

variable "vsphere_resource_pool" {
  description = "Name of the vSphere resource pool (Optional)"
  default = ""
  type = string
}

variable "vsphere_boot2docker_url" {
  description = "URL for the boot2docker ISO (Optional)"
  default = ""
  type = string
}

variable "vsphere_cfgparam" {
  description = "vSphere vm configuration parameters (used for guestinfo) (Optional)"
  default = ["disk.enableUUID=TRUE"]
  type = list
}

variable "vsphere_virtual_machine_template" {
  description = "Name of the vSphere virtual machine template to clone from (Optional)"
  default = ""
  type = string
}

variable "cloud_init_data" {
  description = "Relative Path for Cloud-init configuration yaml file (Optional)"
  default = ""
  type = string
}

variable "vsphere_virtual_machine_creation_type" {
  description = "Creation type when creating a new virtual machine. Supported values: vm, template, library, legacy. Defaults to 'template' (Optional)"
  default = "template"
  type = string
}

variable "vsphere_folder" {
  description = "Name of the vSphere folder for the nodes. This folder must already exist in the datacenter (Optional)"
  default = ""
}

variable "vm_num_cpus" {
  description = "Number of virtual CPUs for the VM/nodes. Defaults to '2'"
  default = "2"
  type = string
}

variable "vm_disk_size" {
  description = "Size of the VM's disk in MiB. Defaults to '30720'"
  default = "30720"
  type = string
}

variable "vm_memory" {
  description = "Size of the VM's memory in MiB. Defaults to '4096'"
  default = "4096"
  type = string
}

variable "vm_network" {
  description = "Name of the VM's network"
  type = list
}

variable "ssh_user" {
  description = "SSH user for the VM"
  default = "docker"
}

variable "ssh_user_group" {
  description = "SSH user group for the VM"
  default = "staff"
}

variable "ssh_port" {
  description = "SSH port for the VM"
  default = 22
}

variable "ssh_password" {
  description = "SSH password for the VM"
  default = "tcuser"
}
