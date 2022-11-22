terraform {

  required_version = ">=1.0.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.62.0"
    }
  }
}

provider "aws" {
  allowed_account_ids = [ var.aws_account_id ]
  assume_role {
    role_arn = var.user_account_role_arn
  }
  
  region  = var.aws_region
  profile = "default"
}