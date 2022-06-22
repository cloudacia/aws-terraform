#TERRAFORM CONFIGURATION FOR AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.57.0"
    }
  }
}

# DEFAULT AWS REGION
provider "aws" {
  region = var.aws_region
}
