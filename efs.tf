# Elastic File System
resource "aws_efs_file_system" "mage-efs" {
    performance_mode = "${var.efs-performance-mode}"
    encrypted = "${var.efs-encrypted}"

    tags {
        Name = "mage-efs"
        group = "mage-efs"
    }
}
