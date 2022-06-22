# AWS ALB TARGET GROUP
resource "aws_alb_target_group" "alb_tg_webserver" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.cloudacia_vpc.id

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 10
    interval            = 30
    matcher             = "200"
  }
}

resource "aws_lb_target_group_attachment" "web_server" {
  target_group_arn = aws_alb_target_group.alb_tg_webserver.arn
  target_id        = aws_instance.web01.id
  port             = 80
}
