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

  #access_logs {
  #  bucket  = aws_s3_bucket.elb_bucket.id
  #  enabled = true

  #}
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
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Access Denied"
      status_code  = "403"
    }
  }
}

#################################################
# APPLICATION LOAD BALANCER LISTENER RULE       #
#################################################
resource "aws_lb_listener_rule" "alb_listener_https" {
  listener_arn = aws_alb_listener.alb_listener_https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg_webserver.arn
  }

  condition {
    http_header {
      http_header_name = var.custom_header["key"]
      values           = [var.custom_header["value"]]
    }
  }
}
