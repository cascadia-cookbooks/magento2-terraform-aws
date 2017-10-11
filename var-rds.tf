variable "rds-identifier" {
    description = "Identifier for RDS instance"
    default = "mage2-mysql"
}

variable "rds-instance-class" {
    description = "Instance class for RDS"
    default = "db.t2.micro"
}

variable "rds-allocated-storage" {
    description = "Storage size for RDS"
    default = 10
}

variable "rds-storage-type" {
    description = "Storage backend for RDS"
    default = "gp2" # Designator for 'SSD' storage
}

variable "rds-multi-az" {
    description = "Multi-AZ designator for RDS"
    default = false
}

variable "rds-port" {
    description = "Connection port for RDS"
    default = 3306
}

variable "rds-db-name" {
    description = "RDS datbase name"
    default = "magedb"
}

variable "rds-db-user" {
    description = "RDS database user"
    default = "dbuser"
}

variable "rds-db-password" {
    description = "RDS database password"
    default = "dbpassword" # NOTE: Ideal candidate for LastPass external data source
}
