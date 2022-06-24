###############################################
#  TERRAFORM PROVIDER CONFIGURATION           #
###############################################
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

###############################################
#  AWS DEFAULT REGION                         #
###############################################
provider "aws" {
  region = var.aws_region
}
