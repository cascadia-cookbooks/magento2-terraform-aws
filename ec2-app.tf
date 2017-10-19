# Auto scaling group launch configuration
resource "aws_launch_configuration" "app" {
    name = "${var.asg-app-name}"
    image_id = "${data.aws_ami.rhel.id}"
    instance_type = "${var.asg-app-instance-type}"

    security_groups = ["${aws_security_group.app.id}"]
    key_name = "pass"

    user_data = "${data.template_file.user_data.rendered}"

    lifecycle {
        create_before_destroy = true
    }
}
