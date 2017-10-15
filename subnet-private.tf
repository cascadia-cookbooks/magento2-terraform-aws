# Private subnets
resource "aws_subnet" "private" {
    count = "${data.aws_availability_zones.available.names.count}"
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.private_cidr[count.index]}"
    availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
    map_public_ip_on_launch = false
    tags {
        Name = "private-${count.index}"
        group = "mage-sub"
    }
}
