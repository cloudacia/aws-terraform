#######################################################
# GET DATA FROM AN AWS ROUTE53 ZONE                   #
#######################################################
data "aws_route53_zone" "cloudacia" {
  name         = var.domain_name
  private_zone = false

  provider = aws.virginia
}
