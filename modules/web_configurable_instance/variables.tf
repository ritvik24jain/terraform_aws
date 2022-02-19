variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "managednodes_instance_type" {
  type = string
}
variable "managednodes_ami_id" {
  type = string
}
variable "pubkey" {
  type = string
}
variable "managed_modes_count" {
  type = string
  default =0
}
variable "ansible_security_group_id" {
  type = string
}

variable "lb_sg_id" {
  type = string
}