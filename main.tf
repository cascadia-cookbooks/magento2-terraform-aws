provider "aws" {
    access_key = "${data.external.lpass.result.access_key}"
    secret_key = "${data.external.lpass.result.secret_key}"
    region = "${var.region}"
}

resource "aws_vpc" "default" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "magento2"
        group = "mage-vpc"
    }
}
