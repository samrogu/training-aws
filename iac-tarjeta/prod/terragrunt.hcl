include {
    path = find_in_parent_folders()
}


generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
        bucket = "saguro-training-aws"
        key = "rapid/prod/vpc/terraform.tfstate" 
        region = "us-east-2"
    }
}
EOF
}

inputs = {
    product = "banca-digital-prod"
    vpc_cdir = "175.0.0.0/16"
    public_subnets = ["175.0.4.0/26", "175.0.5.0/26", "175.0.6.0/26"]
    private_subnets = ["175.0.1.0/26", "175.0.2.0/26", "175.0.3.0/26"]
    database_subnets = ["175.0.7.0/26", "175.0.8.0/26"]
    enable_nat_gateway = true
}