# Public subnet Internet gateway
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}

# Public subnets
resrouce "aws_subnet" "public" {
    count = 1
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_cidr[count.index]}"
    availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
    map_public_ip_on_launch = true
    depends_on = ["aws_internet_gateway"]
    tags {
        Name = "public-${count.index}"
        group = "mage-sub"
    }
}
