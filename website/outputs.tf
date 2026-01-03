output "server_id" {
  value = aws_instance.webserver.id
}

output "server_arn" {
  value = aws_instance.webserver.arn
}

output "vpc_id" {
  value = aws_vpc.main.id
}
output "subnet_id" {
  value = aws_subnet.web_subnet.id
}
output "instance_public_ip" {
  value = aws_instance.webserver.public_ip
}
