terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.99.0"
    }
  }

  backend "s3" {
    bucket = "remote-state-skptech"
    key = "roboshop-dev-user"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}

provider "aws" {
    region = "us-east-1"  
    profile = default
}