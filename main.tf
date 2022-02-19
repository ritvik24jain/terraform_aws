module "aws_vpc_create" {
  source = "./modules/aws_vpc_module"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs = var.public_subnet_cidrs

}

module "ansible_instance_creation" {
    source = "./modules/ansible_instance"
    ansible_ami_id = var.ansible_ami_id
    ansible_instance_type = var.ansible_instance_type
    vpc_id = module.aws_vpc_create.vpc_id
    public_subnet_id = module.aws_vpc_create.public_subnet_id[0]
    pubkey = var.pubkey

}

module "configurable_instance" {
  source = "./modules/web_configurable_instance"
   vpc_id = module.aws_vpc_create.vpc_id
   subnet_ids = module.aws_vpc_create.private_subnet_id
   managednodes_ami_id = var.managednodes_ami_id
   managednodes_instance_type = var.managednodes_instance_type
   ansible_security_group_id = module.ansible_instance_creation.ansible_security_group_id
   pubkey = var.pubkey
   lb_sg_id = module.aws_frontend_lb.lb_security_group_id
}

module "aws_frontend_lb" {
  source = "./modules/loadbalancer"
  lb_name= var.lb_name
  lb_type = var.lb_type
  isInternal= var.isInternal
  subnet_ids =module.aws_vpc_create.public_subnet_id
  bucket_name = module.lb_access_logs.bucket_id
 vpc_id = module.aws_vpc_create.vpc_id
}

module "lb_access_logs" {
  source = "./modules/s3_bucket"
  bucket_name= var.bucket_name
  region = var.region
}
