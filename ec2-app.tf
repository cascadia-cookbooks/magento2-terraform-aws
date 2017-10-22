# Auto scaling group launch configuration
resource "aws_launch_configuration" "app" {
    name = "${var.asg-app-name}"
    image_id = "${data.aws_ami.rhel.id}"
    instance_type = "${var.asg-app-instance-type}"

    security_groups = ["${aws_security_group.app.id}"]
    key_name = "${aws_key_pair.asg-app.key_name}"

    user_data = "${coalesce(var.asg-user-data, data.template_file.user_data.rendered)}"

    lifecycle {
        create_before_destroy = true
    }
}

# Application autoscaling group
resource "aws_autoscaling_group" "app" {
    name = "${var.asg-app-name}"
    launch_configuration = "${aws_launch_configuration.app.id}"
    availability_zones =  ["${data.aws_availability_zones.available.names}"]

    vpc_zone_identifier = ["${aws_subnet.private.*.id}"]

    load_balancers = ["${aws_elb.app.name}"]
    health_check_type = "ELB"
    health_check_grace_period = "${var.asg-health-check-grace-period}"

    min_size = "${var.asg-min-size}"
    max_size = "${var.asg-max-size}"

    lifecycle {
        create_before_destroy = true
    }

    tag {
        key = "Name"
        value = "${var.asg-app-name}"
        propagate_at_launch = true
    }

    tag {
        key = "group"
        value = "mage-asg"
        propagate_at_launch = true
    }
}
