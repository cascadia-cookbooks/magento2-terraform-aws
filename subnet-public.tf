# Public subnet Internet gateway
resource "aws_internet_gateway" "default" {
    vpc_id = "${aws_vpc.default.id}"
}

# Public subnets
resource "aws_subnet" "public" {
    count = 1
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${var.public_cidr[count.index]}"
    availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
    map_public_ip_on_launch = true
    depends_on = ["aws_internet_gateway.default"]
    tags {
        Name = "public-${count.index}"
        group = "mage-sub"
    }
}

# Routing table and association
resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
}

resource "aws_route_table_association" "public" {
    count = 1
    subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
    route_table_id = "${aws_route_table.public.id}"
}
