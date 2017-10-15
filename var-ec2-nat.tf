# NAT Instance
data "aws_ami" "nat" {
    most_recent = true
    filter {
        name = "name"
        values = ["amzn-ami-vpc-nat-hvm*"]
    }
    owners = ["amazon"]
}

variable "ec2-nat-instance-type" {
    description = "EC2 instance type for NAT"
    default = "t2.micro"
}
