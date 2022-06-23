####################################################
# Load Balancer Target Group                       #
####################################################
resource "aws_alb_target_group" "alb_tg_webserver" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_dev.id

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }
}
