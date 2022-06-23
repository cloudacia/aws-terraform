####################################################
# AWS Role to used by an EC2 instance              #
####################################################
resource "aws_iam_role" "instance_role01" {
  name               = "instance_role01"
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

}

####################################################
# AWS Policy that allow a role to access AWS S3    #
####################################################
resource "aws_iam_role_policy" "role_policy01" {
  name = "role_policy01"
  role = aws_iam_role.instance_role01.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

####################################################
# AWS instance profile                             #
####################################################
resource "aws_iam_instance_profile" "instance_profile01" {
  name = "instance_profile01"
  role = aws_iam_role.instance_role01.id
}
