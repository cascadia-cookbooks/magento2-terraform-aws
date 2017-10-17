resource "aws_elasticache_cluster" "redis" {
    cluster_id = "${var.elasticache-cluster-id}"
    engine = "redis"
    node_type = "${var.elasticache-node-type}"
    port = "${var.elasticache-port}"
    num_cache_nodes = 1
    parameter_group_name = "pass"
    security_group_ids = ["${aws_security_group.redis.id}"]
    subnet_group_name = "pass"
}
