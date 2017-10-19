resource "aws_key_pair" "asg-app" {
    key_name = "magento-asg-app"
    public_key = "${data.external.lpass.result.ssh_key}"
}
