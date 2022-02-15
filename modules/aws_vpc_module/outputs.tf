output "vpc_arn" {
value = aws_vpc.main.arn
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet[*].id
}


output "private_subnet_id" {
  value = aws_subnet.private_subnet[*].id
}