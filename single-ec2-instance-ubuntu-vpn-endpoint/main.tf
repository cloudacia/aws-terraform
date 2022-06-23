#TERRAFORM CONFIGURATION FOR AWS
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# DEFAULT AWS REGION
provider "aws" {
  region = var.aws_region
}
