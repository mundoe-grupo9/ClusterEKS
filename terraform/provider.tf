terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }

  backend "s3" {
    bucket         = "grupo9-terraform-test"
    dynamodb_table = "terraform_state"
    key            = "kubernetes"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = var.REGION
}
