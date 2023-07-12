variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "vpc_target_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "enable_dns" {
  type    = bool
  default = true
}

variable "target_vpc_subnet01" {
  type        = string
  default     = "10.1.1.0/24"
  description = "A public network"
}


variable "target_vpc_availability_zone01" {
  type        = string
  default     = "us-west-2a"
  description = "US East (N. Virginia)"
}

variable "target_vpc_default_gateway_1" {
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


variable "staging_vpc_cidr" {
  type    = string
  default = "192.168.0.0/16"
}


variable "staging_vpc_subnet01" {
  type        = string
  default     = "192.168.1.0/24"
  description = "A private network"
}

variable "staging_vpc_availability_zone01" {
  type        = string
  default     = "us-west-2a"
  description = "US East (N. Virginia)"
}
