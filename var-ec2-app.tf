# Most recent RHEL 7 AMI
data "aws_ami" "rhel" {
    most_recent = true
    filter {
        name = "name"
        values = ["RHEL-7.4_HVM_GA-*-x86_64-1-Hourly2-GP2"]
    }
    owners = ["309956199498"] # NOTE: Official Red Hat account https://access.redhat.com/solutions/15356
}

variable "asg-app-name" {
    default = "mage-asg-app"
}

variable "asg-app-instance-type" {
    description = "EC2 instance type for app ASG"
    default = "t2.micro"
}
