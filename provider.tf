provider "aws" {
  #   profile = "default"
  region = var.region
}
terraform {
  required_version = ">= 1.1"
}



terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "test-tf-devops-24324"
    key              	 = "state/terraform.tfstate"
    region         	   = "ap-south-1"
    encrypt        	   = true
    # dynamodb_table = "test_tf_devops_tf_lockid_98453"
  }
}