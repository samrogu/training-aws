terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  # Configuration 
  alias = "primary"
  region = "us-east-2"
}

provider "aws" {
  # Configuration 
  alias = "secondary"
  region = "us-east-1"
}