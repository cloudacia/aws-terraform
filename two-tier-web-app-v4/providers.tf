terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {    
    region = var.aws_source_region_name
    alias = "virginia"    
}

provider "aws" {    
    region = var.aws_target_region_name
    alias = "oregon"
}