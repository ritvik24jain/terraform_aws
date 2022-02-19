variable "lb_name" {
  type = string
}
variable "isInternal" {
  type = bool
}
variable "lb_type" {
    type = string
    default = "application"
  
}
variable "subnet_ids" {
  type = list(string)
}
variable "bucket_name" {
    type = string
  
}
variable "vpc_id" {
  type = string
}