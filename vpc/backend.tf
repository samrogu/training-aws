terraform {
  backend "s3" {
    bucket = "saguro-training-aws"
    key = "rapid/vpc/terraform.tfstate" 
  }
}