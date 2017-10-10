variable "region" {
    description = "AWS region"
    default = "us-west-2"
}

data "aws_availability_zones" "available" {}
