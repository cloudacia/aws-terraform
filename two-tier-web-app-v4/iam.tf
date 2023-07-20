resource "aws_iam_role" "rds_role_agent" {
  name               = var.source_ec2_drs_role
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

resource "aws_iam_role_policy_attachment" "attachment_01" {
  role       = aws_iam_role.rds_role_agent.name
  policy_arn = var.source_ec2_role_policy_1

  provider = aws.virginia
}

resource "aws_iam_instance_profile" "ec2_source_instance_profile_01" {
  name = var.source_ec2_instance_profile_name
  role = aws_iam_role.rds_role_agent.id

  provider = aws.virginia
}

