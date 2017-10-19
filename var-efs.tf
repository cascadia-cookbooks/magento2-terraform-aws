variable "efs-performance-mode" {
    description = "Performance mode for Elastic File System"
    default = "generalPurpose"
    # NOTE: valid options are 'generalPurpose' and 'maxIO'
}

variable "efs-encrypted" {
    description = "Encrypt EFS"
    default = false
}
