data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ansible" {
  ami           = var.ansible_ami_id == "" ? var.ansible_ami_id : data.aws_ami.ubuntu.id
  subnet_id   = var.public_subnet_id
  instance_type = var.ansible_instance_type
  vpc_security_group_ids = [aws_security_group.allow_all_traffic.id]
  tags = {
    Name = "Ansible Server"
  }
  key_name = aws_key_pair.ansible.key_name
}

resource "aws_security_group" "allow_all_traffic" {
  name        = "allow_all_traffic"
  description = "Allow all inbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "allow all traffic"
  }
}

resource "aws_security_group_rule" "example" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_all_traffic.id
}

resource "aws_key_pair" "ansible" {
  key_name   = "ansible-key"
  public_key = var.pubkey
}