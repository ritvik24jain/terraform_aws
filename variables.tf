variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/24"
}
variable "private_subnet_cidrs" {
  default = ["10.0.0.0/27", "10.0.0.32/27"]
  type = list(string)
}
variable "public_subnet_cidrs" {
  default = ["10.0.0.64/27", "10.0.0.96/27"]
  type = list(string)
}
variable "vpc_name" {
  type = string
  default = "customer_vpc"
}
variable "region" {
  type = string
  default = "us-east-1"
}

variable "ansible_ami_id" {
  type = string
  default = ""
}

variable "ansible_instance_type" {
  type = string
  default = "t2.micro"
}
variable "managednodes_ami_id" {
  type = string 
  default = ""
}

variable "managednodes_instance_type" {
  type = string
 default = "t2.micro"
}

variable "pubkey" {
  type= string
}

variable "managed_modes_count" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "isInternal" {
  type = bool
}

variable "lb_type" {
  type = string
}

variable "bucket_name" {
  type = string
}
