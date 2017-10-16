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

# Routing table and association
resource "aws_route_table" "private" {
    count = "${data.aws_availability_zones.available.names.count}"
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${element(aws_instance.nat.*.id, count.index)}"
    }
}

resource "aws_route_table_association" "private" {
    count = "${data.aws_availability_zones.available.names.count}"
    subnet_id = "${element(aws_subnet.private.*.id, count.index)}"
    route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}
