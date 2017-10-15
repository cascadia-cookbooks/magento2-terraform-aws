# NAT Instance
data "aws_ami" "nat" {
    most_recent = true
    filter {
        name = "name"
        values = ["amzn-ami-vpc-nat-hvm*"]
    }
    owners = ["amazon"]
}
