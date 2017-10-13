variable "region" {
    description = "AWS region"
    default = "us-west-2"
}

data "aws_availability_zones" "available" {}

variable "vpc_cidr" {
    description = "VPC CIDR block"
    default = "10.10.0.0/16"
}

variable "public_cidr" {
    description = "CIDR blocks for public subnets"
    default = [
        "10.10.1.0/24",
        "10.10.2.0/24",
        "10.10.3.0/24",
        "10.10.4.0/24",
        "10.10.5.0/24",
        "10.10.6.0/24"
    ]
}

variable "private_cidr" {
    description = "CIDR blocks for private subnets"
    default = [
        "10.10.101.0/24",
        "10.10.102.0/24",
        "10.10.103.0/24",
        "10.10.104.0/24",
        "10.10.105.0/24",
        "10.10.106.0/24"
    ]
}
