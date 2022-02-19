pubkey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgtj1wAwwCho/DNzmKGtXiSfzewvE8XBnupewuIzfITeeogkfvYGyRlndx6IIjI+0aMXc6ElwmWE9S1Qy6cRMY/biYfV+ft4d36TBzXAJkanYDk7si6QD617O9sJZfslNEa4gDJSYrzCNJzb6WGqjfJv/y8sbiHQPupgbxLclNs1GKh6N97cV5jx6CVmPGDk0nfZ9LnauEIa1qwKYZtzNBBiFhWiYaaBXnkLPlX1tfVVOve1agXJTi3FtbU2c8XasPg67Qq+ZQ4Hy3iLZd1w+xs2DGBVl0+XoNHMzM1Qb/R9v0xWBO3T4D8YBINzQlR6A32gM0ZoP+rqEw3gcqzvHv ubuntu"
ansible_ami_id = "ami-0053889d965c46912"
vpc_cidr = "10.0.0.0/24"
private_subnet_cidrs=["10.0.0.0/27", "10.0.0.32/27"]
public_subnet_cidrs=["10.0.0.64/27", "10.0.0.96/27"]
vpc_name="customvpc"
region = "us-east-1"
ansible_instance_type="t2.micro"
managednodes_ami_id ="ami-0053889d965c46912"
managednodes_instance_type="t2.micro"
managed_modes_count=2
bucket_name = "rj2tetstststs"


##lbparams
lb_name= "rj2testinglb"
isInternal = false
lb_type = "application"