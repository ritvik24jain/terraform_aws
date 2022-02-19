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

resource "aws_instance" "web_managednodes" {
  count = var.managed_modes_count
  ami           = var.managednodes_ami_id == "" ? var.managednodes_ami_id : data.aws_ami.ubuntu.id
  subnet_id   = element(var.subnet_ids, count.index)
  instance_type = var.managednodes_instance_type
  vpc_security_group_ids = [aws_security_group.only_allow_web_traffic.id]
  tags = {
    Name = "web server ${count.index}"
  }
  key_name = aws_key_pair.managednodes.key_name
}

resource "aws_security_group" "only_allow_web_traffic" {
  name        = "allow_all_web"
  description = "Allow all inbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "allow all traffic"
  }
}

resource "aws_security_group_rule" "rule1" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = var.lb_sg_id
  security_group_id = aws_security_group.only_allow_web_traffic.id
}

resource "aws_security_group_rule" "rule2" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.only_allow_web_traffic.id
  source_security_group_id = var.ansible_security_group_id
}

resource "aws_key_pair" "managednodes" {
  key_name   = "managednodes-key"
  public_key = var.pubkey
}