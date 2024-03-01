###############################################
#  AWS IAM ROLE                               #
###############################################
resource "aws_iam_role" "web_server_01" {
  name               = "web_server_01"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  provider = aws.virginia

}

##########################################################
# Attach an IAM policy to the role                       #
##########################################################
resource "aws_iam_role_policy_attachment" "attachment_01" {
  role       = aws_iam_role.web_server_01.id
  policy_arn = var.ssm_access_policy

  provider = aws.virginia
}

##########################################################
# Attach an IAM policy to the role                       #
##########################################################
resource "aws_iam_role_policy_attachment" "attachment_02" {
  role       = aws_iam_role.web_server_01.id
  policy_arn = var.s3_full_access_policy

  provider = aws.virginia
}

###############################################
#  AWS IAM INSTANCE PROFILE                   #
###############################################
resource "aws_iam_instance_profile" "web_server_01" {
  name = "web_server_01"
  role = aws_iam_role.web_server_01.id

  provider = aws.virginia
}
