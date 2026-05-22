output "vpc_id" {
    value = aws_vpc.custom_vpc.id
}

output "subnet_id" {
    value = aws_subnet.custom_public_subnet.id
}

output "security_group_id" {
    value = aws_security_group.custom_security_group.id
}

output "instance_id" {
    value = aws_instance.custom_instance.id
}

output "public_ip" {
    value = aws_instance.custom_instance.public_ip
}

output "private_ip" {
    value = aws_instance.custom_instance.private_ip
}