resource "aws_iam_role" "instance_role01" {
  name               = "DRSRoleAgent"
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

resource "aws_iam_role_policy_attachment" "attachment01" {
  role       = aws_iam_role.instance_role01.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticDisasterRecoveryAgentInstallationPolicy"
}

resource "aws_iam_instance_profile" "instance_profile01" {
  name = "instance_profile01"
  role = aws_iam_role.instance_role01.id
}
