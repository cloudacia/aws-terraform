###############################################
#  ELASTICACHE SUBNET GROUP                   #
###############################################

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name = "cloudacia-subnet-group"
  subnet_ids = [aws_subnet.subnet09.id,
  aws_subnet.subnet10.id]
}

###############################################
#  ELASTICACHE REDIS SETTTING                 #
###############################################

resource "aws_elasticache_replication_group" "redis_wp" {
  automatic_failover_enabled = true
  replication_group_id       = "tf-rep-group-1"
  description                = "Redis Replication"
  node_type                  = var.redis_node_type
  num_cache_clusters         = 2
  parameter_group_name       = var.redis_param_group_name
  port                       = 6379
  subnet_group_name          = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids         = [aws_security_group.elasticache.id]
  multi_az_enabled           = true
}
