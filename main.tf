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

# module "configurable_instance" {
#   source = "./modules/create_instance"
#    vpc_id = modules.aws_vpc_create.vpc_id
#    private_subnet_id = modules.aws_vpc_create.private_subnet_id
#    configurable_instance_ami_id = var.configurable_instance_ami_id
#    configurable_instance_type = var.configurable_instance_type
#    ansible_security_group_id = modules.ansible_instance_creation.ansible_security_group_id
# }