# RDS Instance
resource "aws_db_instance" "mysql" {
    identifier        = "${var.rds-identifier}"
    instance_class    = "${var.rds-instance-class}"
    allocated_storage = "${var.rds-allocated-storage}"
    engine            = "mysql"
    multi_az          = "${var.rds-multi-az}"
  
    port = "${var.rds-port}"
  
    name     = "${var.rds-db-name}"
    username = "${var.rds-db-user}"
    password = "${var.rds-db-password}"
  
    vpc_security_group_ids        = ["${aws_security_group.mysql.id}"]
    db_subnet_group_name = "${aws_db_subnet_group.default.name}"
}

# RDS subnet group
resource "aws_db_subnet_group" "default" {
    name        = "main"
    description = "Subnet group for RDS"
    subnet_ids  = ["${aws_subnet.private.*.id}"]
    tags {
        Name = "mage-db-subnet-group"
    }
}
