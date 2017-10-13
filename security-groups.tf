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
