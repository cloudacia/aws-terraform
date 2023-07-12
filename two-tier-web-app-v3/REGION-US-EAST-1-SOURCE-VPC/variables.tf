variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "enable_dns" {
  type    = bool
  default = true
}

variable "tag_name" {
  type    = string
  default = "APL01"
}

variable "subnet01" {
  type        = string
  default     = "10.1.1.0/24"
  description = "A public network"
}

variable "availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

variable "default_gateway_1" {
  type    = string
  default = "0.0.0.0/0"
}

variable "ssh_key_name" {
  type    = string
  default = "DRS DEMO KEY"
}

variable "ssh_public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5PcvlG+/CdPKwiGirz0nHFetCcQBv3WGHuJ8ETcOwj4e88I2PAHB+PCB6kEDVJ6gf8E3XDBPV/C1WA4BhrTM+ksj1veroakfcjbC7i2JbwInlDwXCCD48u6dapQxyFf5I0PfB7V31xtDzvwnRatmgyw7huGSskaP36PKsMoEdOCbHt1nBHpzCujb8qSfr4biQiEau7ZPra/8EF+51TdqoprBB0bx+vTVez7hIjK0qv3MgMG1AdtCn4VzpNSgCXTaszJSLi/tOa9nT9rnweZNzQ0BrpfPrHcFqodI/Ec0h5ukaCZvgfX/USj9dSYMTB+24OXdiRKKJsZ+Q2vAAlOHUU1kn2edokOxIvPrbhjo2/5Ma1VgoYUDagdGW0QPudn8Kk5VfuUA2S/cXrZZDKzzsx1VHY9eX+DAd1rDSR1yhoxVXTkYlGyXSclweqSf1WF8GnvK40gHXvLyfBM6Jqh50ASG9yNVGvI0pQG3ZNg+UcbWw8S8cLipdegLEOQuJQmU="
}

variable "aws_amis" {
  type    = string
  default = "ami-0cff7528ff583bf9a"
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}

variable "instance_connection_type" {
  type    = string
  default = "ssh"
}

variable "instance_username" {
  type    = string
  default = "ec2-user"
}

variable "sg_web_instance_ingress_01" {
  type = list(any)
  default = ["web_instance",
    "Allow web incgress trafic",
    "Allow inbound HTTP traffic",
    80,
    80,
    "tcp",
  "0.0.0.0/0"]
}

variable "sg_web_instance_ingress_02" {
  type = list(any)
  default = ["Allow inbound SSH traffic",
    22,
    22,
    "tcp",
  "0.0.0.0/0"]
}

variable "sg_web_instance_egress_01" {
  type = list(any)
  default = ["Allow outbound ANY traffic",
    0,
    0,
    -1,
  "0.0.0.0/0"]
}

variable "ec2_metadata_option" {
  type = list(string)
  default = ["enabled",
  "optional"]
}

variable "ec2_root_block_device" {
  type    = list(bool)
  default = [true, true]
}


variable "ec2_associate_public_ip_address" {
  type    = bool
  default = true
}


variable "ssl_certificate_01" {
  type    = string
  default = "*.cloudacia.net"
}

variable "www_dns_record01" {
  type    = string
  default = "www.cloudacia.net"
}

variable "domain_name" {
  type    = string
  default = "cloudacia.net."
}
