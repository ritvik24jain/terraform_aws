output "managed_nodes_ip" {
  value= aws_instance.web_managednodes[*].private_ip
}

