terraform {
    required_providers {
            
            aws = {
            source = "hashicorp/aws"
            version = "~>5.0"
        }
    }

backend "s3" {
  bucket = "aws-dev-rk.online"
  key   = "ec2-k8-master"
  region = "us-east-1"
  dynamodb_tables = "aws-locking"
}
# configure the aws provider
provider "aws"
    region = "us-east-1"
}

