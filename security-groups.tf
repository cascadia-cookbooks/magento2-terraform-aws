# RDS security group
resource "aws_security_group" "mysql" {
    name = "magento-mysql"
    description = "Security group for RDS"
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = "${var.rds-port}"
        to_port = "${var.rds-port}"
        protocol = "tcp"
        security_groups = [
            "pass"
        ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "magento-mysql"
        group = "mage-sg"
    }
}

# ElastiCache security group
resource "aws_security_group" "redis" {
    name = "magento-redis"
    description = "Security group for Redis ElastiCache cluster"
    vpc_id = "${aws_vpc.default.id}"

    ingress {
        from_port = "pass"
        to_port = "pass"
        protocol = "tcp"
        security_groups = [
            "pass"
        ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "magento-redis"
        group = "mage-sg"
    }
}

# NAT security group
resource "aws_security_group" "nat" {
    name = "magento-nat"
    description = "Security group for NAT instance"
    vpc_id = "${aws_vpc.default.id}"

    # TODO: SSH access from whitelist

    ingress {
        from_port = 80
        to_port = 80
        portocol = "tcp"
        cidr_blocks = "${var.private_cidr}"
    }

    ingress {
        from_port = 443
        to_port = 443
        portocol = "tcp"
        cidr_blocks = "${var.private_cidr}"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags {
        Name = "magento-nat"
        group = "mage-sg"
    }
}
