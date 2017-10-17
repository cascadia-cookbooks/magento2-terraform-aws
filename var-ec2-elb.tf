variable "elb-name" {
    description = "Application ELB name"
    default = "magento-app-elb"
}

variable "elb-instance-port" {
    description = "ELB listener instance port"
    default = 80
}

variable "elb-lb-port" {
    description = "ELB listener lb port"
    default = 80
}

variable "elb-instance-protocol" {
    description = "ELB listener instance protocol"
    default = "http"
}

variable "elb-lb-protocol" {
    description = "ELB listener lb protocol"
    default = "http"
}

variable "elb-healthy-threshold" {
    description = "ELB healthy threshold"
    default = 2
}

variable "elb-unhealthy-threshold" {
    description = "ELB unhealthy threshold"
    default = 5
}

variable "elb-timeout" {
    description = "ELB health check timeout"
    default = 5
}

variable "elb-target" {
    description = "ELB health check target"
    default = "HTTP:80/"
}

variable "elb-interval" {
    description = "ELB health check interval"
    default = 10
}
