output "vpc_arn" {
value = module.aws_vpc_create.vpc_arn
}

output "vpc_id" {
  value = module.aws_vpc_create.vpc_id
}

output "public_subnet_id" {
  value = module.aws_vpc_create.public_subnet_id
}


output "private_subnet_id" {
  value =  module.aws_vpc_create.private_subnet_id
}

output "bucket_id" {
  value = module.lb_access_logs.bucket_id
}

output "frontend_lb_dns" {
  value = module.aws_frontend_lb.lb_dns
}