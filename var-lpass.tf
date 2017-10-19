# Pulls variables from LastPass
data "external" "lpass" {
    query = {
        project = "${var.lastpass-project}"
    }
    program = ["bash", "${path.module}/scripts/lpass-data.sh"]
}

variable "lastpass-project" {
    description = "Project name in LastPass, aka 'Folder'"
    default = "Magento 2 Template"
}
