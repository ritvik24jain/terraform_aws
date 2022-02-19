output "lb_dns" {
  value = aws_lb.lb_alb.dns_name
}

output "lb_security_group_id" {
  value= aws_security_group.lb_sg.id
}