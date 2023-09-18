##########################################################
# Attach an IAM policy to the role                       #
##########################################################
resource "aws_iam_role_policy_attachment" "attachment_02" {
  role       = var.drs_role_for_ec2_instances
  policy_arn = var.ssm_access_policy

  provider = aws.virginia
}

##########################################################
# Attach an IAM policy to the role                       #
##########################################################
resource "aws_iam_role_policy_attachment" "attachment_03" {
  role       = var.drs_role_for_ec2_instances
  policy_arn = var.s3_full_access_policy

  provider = aws.virginia
}
##########################################################
# Create an instance profile based on the IAM role       #
# previously created.                                    #
##########################################################
resource "aws_iam_instance_profile" "ec2_source_instance_profile_01" {
  name = var.source_ec2_instance_profile_name
  role = var.drs_role_for_ec2_instances

  provider = aws.virginia
}

