module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-${var.product}-${terraform.workspace}"
  cidr = var.vpc_cdir

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  database_subnets    = var.database_subnets

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "${var.product}-${terraform.workspace}"
  }
}