###############################################
#  ELASTIC IP                                 #
###############################################
resource "aws_eip" "lb" {
  instance = aws_instance.web01.id
  vpc      = true
}
