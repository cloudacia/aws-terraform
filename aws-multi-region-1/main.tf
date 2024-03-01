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

##########################################################
# Setting up an AWS provider for the Virginia Region     #
##########################################################
provider "aws" {
  region = var.aws_source_region_name
  alias  = "virginia"
}

##########################################################
# Setting up an AWS provider for the Oregon Region       #
##########################################################
provider "aws" {
  region = var.aws_target_region_name
  alias  = "oregon"
}
