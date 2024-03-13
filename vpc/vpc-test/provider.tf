terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }
  backend "s3" {
    bucket = "174a9-remote-state"
    key    = "multienv1"
    region = "us-east-1"
    dynamodb_table = "174a9-locking"

  }
}



provider "aws" {
  region = "us-east-1"
}