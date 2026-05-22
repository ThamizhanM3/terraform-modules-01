resource "aws_vpc" "custom_vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "custom_public_subnet" {
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
    tags = {
        Name = var.public_subnet_name
    }
}

resource "aws_security_group" "custom_security_group" {
    name = var.security_group_name
    description = var.security_group_name
    vpc_id = aws_vpc.custom_vpc.id
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "custom_instance" {
    ami           = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.custom_public_subnet.id
    security_groups = [aws_security_group.custom_security_group.id]
    key_name = var.key_name
    tags = {
        Name = var.instance_name
    }
}