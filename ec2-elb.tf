# Load Balancer
resource "aws_elb" "app" {
    name = "${var.elb-name}"
    subnets = ["${aws_subnet.private.*.id}"]
    security_groups = ["${aws_security_group.elb.id}"]

    listener {
        instance_port = "${var.elb-instance-port}"
        lb_port = "${var.elb-lb-port}"
        instance_protocol = "${var.elb-instance-protocol}"
        lb_protocol = "${var.elb-lb-protocol}"
    }

    health_check {
        healthy_threshold = "${var.elb-healthy-threshold}"
        unhealthy_threshold = "${var.elb-unhealthy-threshold}"
        timeout = "${var.elb-timeout}"
        target = "${var.elb-target}"
        interval = "${var.elb-interval}"
    }

    tags {
        group = "mage-elb"
    }
}
