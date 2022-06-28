###############################################
#  AWS APPLICATION LOAD BALANCER              #
###############################################
resource "aws_lb" "alb01" {
  name                       = "alb01"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.elb.id]
  subnets                    = [aws_subnet.subnet01.id, aws_subnet.subnet02.id]
  enable_deletion_protection = false
}

#################################################
# APPLICATION LOAD BALANCER LISTENER TCP/HTTPS  #
#################################################
resource "aws_alb_listener" "alb_listener_https" {
  load_balancer_arn = aws_lb.alb01.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.certificate_asterisk.id

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg_webserver.arn
  }
}

#################################################
# APPLICATION LOAD BALANCER LISTENER TCP/HTTP   #
#################################################
resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = aws_lb.alb01.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
