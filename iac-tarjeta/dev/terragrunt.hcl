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
        key = "rapid/dev/vpc/terraform.tfstate" 
        region = "us-east-2"
    }
}
EOF
}

inputs = {
    product = "banca-digital-dev"
    vpc_cdir = "173.0.0.0/16"
    public_subnets = ["173.0.4.0/26", "173.0.5.0/26", "173.0.6.0/26"]
    private_subnets = ["173.0.1.0/26", "173.0.2.0/26", "173.0.3.0/26"]
    database_subnets = ["173.0.7.0/26", "173.0.8.0/26"]
}