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