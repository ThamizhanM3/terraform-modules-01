variable "aws_region" {
    type = string
    default = "ap-south-1"
}

variable "instance_type" {
    type    = string
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    default = "ami-07a00cf47dbbc844c"
}

variable "instance_name" {
    type = string
}

variable "vpc_name" {
    type = string
}

variable "vpc_cidr" {
    type = string
}

variable "public_subnet_cidr" {
    type = string
}

variable "public_subnet_name" {
    type = string
}

variable "security_group_name" {
    type = string
}

variable "key_name" {
    type = string
}