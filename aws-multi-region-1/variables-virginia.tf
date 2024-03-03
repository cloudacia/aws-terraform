###############################################
#    AWS PROVIDER                             #
###############################################
variable "aws_source_region_name" {
  type    = string
  default = "us-east-1"
}

###############################################
#    AWS PROVIDER                             #
###############################################
variable "aws_target_region_name" {
  type    = string
  default = "us-west-2"
}

###############################################
#    AWS REGION                               #
###############################################
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "US East (N. Virginia)"
}

###############################################
#    AWS VPC CIDR                             #
###############################################
variable "vpc_cidr_virginia" {
  type        = string
  default     = "10.1.0.0/16"
  description = ""
}

###############################################
#    VPC SUBNET #1                            #
###############################################
variable "subnet01_vpc_virginia" {
  type        = string
  default     = "10.1.1.0/24"
  description = "A public network"
}

###############################################
#    VPC SUBNET #2                            #
###############################################
variable "subnet02_vpc_virginia" {
  type        = string
  default     = "10.1.2.0/24"
  description = "A public network"
}

###############################################
#    VPC SUBNET #3                            #
###############################################
variable "subnet03_vpc_virginia" {
  type        = string
  default     = "10.1.3.0/24"
  description = "A private network"
}

###############################################
#    VPC SUBNET #4                            #
###############################################
variable "subnet04_vpc_virginia" {
  type        = string
  default     = "10.1.4.0/24"
  description = "A private network"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "availability_zone01_virginia" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

###############################################
#    SUBNET AVAILABILITY ZONE                 #
###############################################
variable "availability_zone02_virginia" {
  type        = string
  default     = "us-east-1b"
  description = "US East (N. Virginia)"
}

###############################################
#    EC2 AMI                                  #
###############################################
variable "aws_amis_virginia" {
  type    = string
  default = "ami-0cff7528ff583bf9a"
}


###############################################
#    EC2 INSTANCE TYPE                        #
###############################################
variable "instance_type" {
  type    = string
  default = "t2.micro"
}


###############################################
#    DNS DOMAIN NAME                          #
###############################################
variable "domain_name" {
  type    = string
  default = "cloudacia.net."
}

###############################################
#    WWWW DNS RECORD                          #
###############################################
variable "www_dns_record01" {
  type    = string
  default = "www.cloudacia.net"
}

###############################################
#    WWWW DNS RECORD                          #
###############################################
variable "www_dns_record02" {
  type    = string
  default = "cloudacia.net"
}

###############################################
#    EBS DEVICE NAME                          #
###############################################
variable "ebs_device_name" {
  type    = string
  default = "/dev/sdh"
}

###############################################
#    IAM POLICY                               #
###############################################
variable "ssm_access_policy" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

###############################################
#    IAM POLICY                               #
###############################################
variable "s3_full_access_policy" {
  type    = string
  default = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

###############################################
#    VPC ENDPOINTS                            #
###############################################
variable "ssm_enpoint_1_vpc_virginia" {
  type    = string
  default = "com.amazonaws.us-east-1.ssm"
}

###############################################
#    VPC ENDPOINTS                            #
###############################################
variable "ssm_enpoint_2_vpc_virginia" {
  type    = string
  default = "com.amazonaws.us-east-1.ssmmessages"
}

###############################################
#    VPC ENDPOINTS                            #
###############################################
variable "ssm_enpoint_3_vpc_virginia" {
  type    = string
  default = "com.amazonaws.us-east-1.ec2messages"
}

###############################################
#    VPC ENDPOINTS                            #
###############################################
variable "vpc_endpoint_ec2_type_vpc_virginia" {
  type    = string
  default = "Interface"
}


###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_bucket_name" {
  type    = string
  default = "cloudacia-demo-viginia"
}

###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_bucket_acl" {
  type    = string
  default = "private"
}

###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_object_key_1" {
  type    = string
  default = "rc.local"
}

###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_object_acl_1" {
  type    = string
  default = "private"
}

###############################################
#    S3 RESOURCES                             #
###############################################
variable "vpc_source_object_source_1" {
  type    = string
  default = "files-virginia/rc.local"
}
