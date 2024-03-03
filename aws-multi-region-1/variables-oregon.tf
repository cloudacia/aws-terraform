###############################################
#    AWS VPC CIDR                             #
###############################################
variable "vpc_cidr_oregon" {
  type        = string
  default     = "10.2.0.0/16"
  description = ""
}

###############################################
#    VPC SUBNET #1                            #
###############################################
variable "subnet01_vpc_oregon" {
  type        = string
  default     = "10.2.1.0/24"
  description = "A public network"
}

###############################################
#    VPC SUBNET #2                            #
###############################################
variable "subnet02_vpc_oregon" {
  type        = string
  default     = "10.2.2.0/24"
  description = "A public network"
}

###############################################
#    VPC SUBNET #3                            #
###############################################
variable "subnet03_vpc_oregon" {
  type        = string
  default     = "10.2.3.0/24"
  description = "A private network"
}

###############################################
#    VPC SUBNET #4                            #
###############################################
variable "subnet04_vpc_oregon" {
  type        = string
  default     = "10.2.4.0/24"
  description = "A private network"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "availability_zone01_oregon" {
  type        = string
  default     = "us-west-2a"
  description = ""
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "availability_zone02_oregon" {
  type        = string
  default     = "us-west-2b"
  description = ""
}

###############################################
#    VPC ENDPOINTS                            #
###############################################
variable "ssm_enpoint_1_vpc_oregon" {
  type    = string
  default = "com.amazonaws.us-west-2.ssm"
}

###############################################
#    VPC ENDPOINTS                            #
###############################################
variable "ssm_enpoint_2_vpc_oregon" {
  type    = string
  default = "com.amazonaws.us-west-2.ssmmessages"
}

###############################################
#    VPC ENDPOINTS                            #
###############################################
variable "ssm_enpoint_3_vpc_oregon" {
  type    = string
  default = "com.amazonaws.us-west-2.ec2messages"
}

###############################################
#    VPC ENDPOINTS                            #
###############################################
variable "vpc_endpoint_ec2_type_vpc_oregon" {
  type    = string
  default = "Interface"
}

###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_bucket_name_oregon" {
  type    = string
  default = "cloudacia-demo-oregon"
}

###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_bucket_acl_oregon" {
  type    = string
  default = "private"
}

###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_object_key_1_oregon" {
  type    = string
  default = "rc.local"
}

###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_object_acl_1_oregon" {
  type    = string
  default = "private"
}

###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_object_source_1_oregon" {
  type    = string
  default = "files-oregon/rc.local"
}

###############################################
#    EC2 AMI                                  #
###############################################
variable "aws_amis_oregon" {
  type    = string
  default = "ami-0895022f3dac85884"
}
