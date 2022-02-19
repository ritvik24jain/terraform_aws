resource "aws_lb" "lb_alb" {
  name               = var.lb_name
  internal           = var.isInternal
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [for subnet in var.subnet_ids : subnet]

  enable_deletion_protection = false

#   access_logs {
#     bucket  = var.bucket_name
#     prefix  = var.lb_name
#     enabled = true
#   }

  tags = {
    Environment = "production"
  }
}

resource "aws_security_group" "lb_sg" {
  name        = "allow_all_traffic_forlb"
  description = "Allow all inbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "allow all traffic"
  }
}

resource "aws_security_group_rule" "example" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.lb_sg.id
}