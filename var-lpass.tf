# Pulls variables from LastPass
data "external" "lpass" {
    query = {
        project = "Magento 2 Template"
    }
    program = ["bash", "${path.module}/scripts/lpass-data.sh"]
}
