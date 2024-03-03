#######################################################
# GET DATA FROM AN AWS ROUTE53 ZONE                   #
#######################################################
data "aws_route53_zone" "cloudacia" {
  name         = var.domain_name
  private_zone = false

  provider = aws.virginia
}

###############################################
#  AWS ROUTE53 CNAME RECORD                   #
###############################################
resource "aws_route53_record" "www_primary" {
  zone_id = data.aws_route53_zone.cloudacia.zone_id
  name    = "www.${data.aws_route53_zone.cloudacia.name}"
  type    = "A"
  ttl     = 60
  records = [aws_instance.webs_server_01_vpc_virginia.public_ip]

  failover_routing_policy {
    type = "PRIMARY"
  }

  set_identifier  = "cloudacia_net_primary"
  health_check_id = aws_route53_health_check.cloudacia_net_primary.id

  provider = aws.virginia
}

resource "aws_route53_health_check" "cloudacia_net_primary" {
  ip_address        = aws_instance.webs_server_01_vpc_virginia.public_ip
  port              = "80"
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "3"
  request_interval  = "30"

  provider = aws.virginia
}

resource "aws_route53_record" "www_secondary" {
  zone_id = data.aws_route53_zone.cloudacia.zone_id
  name    = "www.${data.aws_route53_zone.cloudacia.name}"
  type    = "A"
  ttl     = "60"
  records = [aws_instance.webs_server_01_vpc_oregon.public_ip]

  failover_routing_policy {
    type = "SECONDARY"
  }

  set_identifier  = "cloudacia_net_secondary"
  health_check_id = aws_route53_health_check.cloudacia_net_secondary.id
}

resource "aws_route53_health_check" "cloudacia_net_secondary" {
  ip_address        = aws_instance.webs_server_01_vpc_oregon.public_ip
  port              = "80"
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "3"
  request_interval  = "30"

  provider = aws.virginia
}
