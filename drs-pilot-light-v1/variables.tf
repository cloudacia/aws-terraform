variable "aws_source_region_name" {
  type    = string
  default = "us-east-1"
}

variable "aws_target_region_name" {
  type    = string
  default = "us-west-2"
}

variable "source_vpc_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "source_enable_dns" {
    type = bool
    default = true
}

variable "staging_vpc_cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "staging_enable_dns" {
    type = bool
    default = true
}

variable "target_vpc_cidr" {
  type    = string
  default = "10.2.0.0/16"
}

variable "target_enable_dns" {
    type = bool
    default = true
}

variable "source_vpc_subnet_01_cidr" {
    type = string
    default = "10.1.1.0/24"
}

variable "source_vpc_subnet_01_az" {
    type = string
    default = "us-east-1a"
}

variable "staging_vpc_subnet_01_cidr" {
    type = string
    default = "192.168.1.0/24"
}

variable "staging_vpc_subnet_01_az" {
    type = string
    default = "us-west-2a"
}

variable "target_vpc_subnet_01_cidr" {
    type = string
    default = "10.2.1.0/24"
}

variable "target_vpc_subnet_01_az" {
    type = string
    default = "us-west-2a"
}

variable "route_default_gateway" {
    type = string
    default = "0.0.0.0/0"
}

variable "source_ec2_drs_role" {
    type = string
    default = "DRSRoleAgent"
}

variable "source_ec2_role_policy_1" {
    type = string
    default = "arn:aws:iam::aws:policy/"
}

variable "source_ec2_instance_profile_name" {
    type = string
    default = "ec2-instance-source"
}

variable "ec2_instance_ssh_key_name" {
    type = string
    default = "ec2-instance-ssh-key"
}

variable "aws_amis" {
  type    = string
  default = "ami-0cff7528ff583bf9a"
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}

variable "vpc_source_bucket_name" {
    type = string
    default = "rds-demo-for-cloudacia-a"
}

variable "vpc_source_bucket_acl" {
    type = string
    default = "private"
}

variable "vpc_source_object_key_1" {
    type = string
    default = "rc.local"
} 

variable "vpc_source_object_acl_1" {
    type = string
    default = "private"
}

variable "vpc_source_object_source_1" {
    type = string
    default = "files/rc.local"
}

variable "aws_peer_region" {
    type = string
    default = "us-west-2"
}

variable "west_2_s3_endpoint" {
    type = string
    default = "com.amazonaws.us-west-2.s3"
}

variable "vpc_endpoint_s3_type_1" {
    type = string
    default = "Gateway"
}

variable "vpc_endpoint_s3_type_2" {
    type = string
    default = "Interface"
}

variable "west_2_ec2_endpoint" {
    type = string
    default = "com.amazonaws.us-west-2.ec2"
}

variable "vpc_endpoint_ec2_type" {
    type = string
    default = "Interface"
}

variable "west_2_drs_endpoint" {
    type = string
    default = "com.amazonaws.us-west-2.drs"
}

variable "vpc_endpoint_drs_type" {
    type = string
    default = "Interface"
}

variable "ssm_enpoint_1_virginia" {
  type        = string
  default     = "com.amazonaws.us-east-1.ssm"  
}

variable "ssm_enpoint_2_virginia" {
  type        = string
  default     = "com.amazonaws.us-east-1.ssmmessages"  
}

variable "ssm_enpoint_3_virginia" {
  type        = string
  default     = "com.amazonaws.us-east-1.ec2messages"  
}

variable "ssm_enpoint_1_oregon" {
  type        = string
  default     = "com.amazonaws.us-west-2.ssm"  
}

variable "ssm_enpoint_2_oregon" {
  type        = string
  default     = "com.amazonaws.us-west-2.ssmmessages"  
}

variable "ssm_enpoint_3_oregon" {
  type        = string
  default     = "com.amazonaws.us-west-2.ec2messages"  
}

variable s3_int_vpc_endpoint_virginia {
    type = string
    default = "com.amazonaws.us-east-1.s3"
}

variable s3_gtw_vpc_endpoint_virginia {
    type = string
    default = "com.amazonaws.us-east-1.s3"
}

variable ec2_int_vpc_endpoint_virginia {
    type = string
    default = "com.amazonaws.us-east-1.ec2"
}

variable drs_int_vpc_endpoint_virginia {
    type = string
    default = "com.amazonaws.us-east-1.drs"
}

variable drs_role_for_ec2_instances {
    type = string
    default = "AWSElasticDisasterRecoveryRecoveryInstanceRole"
}

variable ssm_access_policy {
    type = string
    default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

variable s3_full_access_policy {
    type = string
    default = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
