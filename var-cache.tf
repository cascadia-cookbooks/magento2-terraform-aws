variable "elasticache-cluster-id" {
    description = "Cluster ID for ElastiCache cluster"
    default = "mage-redis"
}


variable "elasticache-node-type" {
    description = "Node type for ElastiCache cluster"
    default = "cache.t2.micro"
}


variable "elasticache-port" {
    description = "Default ElastiCache port"
    default = 6379
}

