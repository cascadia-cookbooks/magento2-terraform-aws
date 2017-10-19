# Elastic File System
resource "aws_efs_file_system" "mage-efs" {
    performance_mode = "${var.efs-performance-mode}"
    encrypted = "${var.efs-encrypted}"

    tags {
        Name = "mage-efs"
        group = "mage-efs"
    }
}

resource "aws_efs_mount_target" "efs-mount" {
    count = "${data.aws_availability_zones.available.names.count}"
    file_system_id = "${aws_efs_file_system.mage-efs.id}"
    subnet_id = "${element(aws_subnet.private.*.id, count.index)}"
    security_groups = ["${aws_security_group.efs.id}"]
}
