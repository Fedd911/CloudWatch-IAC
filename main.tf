terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "EC2" {
  source = "./modules/EC2"
}

module "CloudWatch" {
  source = "./modules/CloudWatch"
  EC2_id = module.EC2.instance_name
}



