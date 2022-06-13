
# VPC ID
output "vpc_id" {
  value = aws_vpc.vpc_dev.id
}

# ALB DNS NAME
output "alb_dns" {
  value = aws_lb.alb01.dns_name
}
