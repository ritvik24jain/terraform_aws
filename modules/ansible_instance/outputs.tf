output "ansible_security_group_id" {
  value= aws_security_group.allow_all_traffic.id
}

output "ansible_server_ip" {
  value= aws_instance.ansible.private_ip
}

