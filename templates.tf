# User-data template
data "template_file" "user_data" {
    template = "${file("${path.module}/templates/user_data.tpl")}"

    vars {
        mysql_endpoint = "${aws_db_instance.mysql.address}"
        redis_endpoint = "${aws_elasticache_cluster.redis.cache_nodes.0.address}"
    }
}
