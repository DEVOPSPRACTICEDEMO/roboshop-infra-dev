terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "5.98.0"
        }
    }
    
    backend "s3" {
        bucket         = "remote-state-skptech"
        key            = "robo-shop-dev-vpc"
        region         = "us-east-1"
        encrypt        = true
        use_lockfile   = true
      
    }
}

provider "aws" {
    #Congigure the AWS provider with the region
    region = "us-east-1"
}