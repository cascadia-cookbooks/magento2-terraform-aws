# Elastic IP resource
resource "aws_eip" "nat" {
    count = "${data.aws_availability_zones.available.names.count}"
    vpc = true
}

# NAT Instances
resource "aws_instance" "nat" {
    count = "${data.aws_availability_zones.available.names.count}"
    ami = "${data.aws_ami.nat.id}"
    instance_type = "${var.ec2-nat-instance-type}"
}
