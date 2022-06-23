
####################################################
# An Application Load Balancer                     #
####################################################
resource "aws_lb" "alb01" {
  name                       = "alb01"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb.id]
  subnets                    = [aws_subnet.subnet01.id, aws_subnet.subnet03.id]
  enable_deletion_protection = false
}

####################################################
# An Application Load Balancer Listener            #
####################################################
resource "aws_alb_listener" "alb_listener_front_end" {
  load_balancer_arn = aws_lb.alb01.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg_webserver.arn
  }
}
