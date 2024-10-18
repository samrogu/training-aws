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
        key = "rapid/prod/vpc/cob/terraform.tfstate" 
        region = "us-east-2"
    }
}
EOF
}

inputs = {
    zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
    region = "us-east-1"
    product = "banca-digital-prod-cob"
    vpc_cdir = "176.0.0.0/16"
    public_subnets = ["176.0.4.0/26", "176.0.5.0/26", "176.0.6.0/26"]
    private_subnets = ["176.0.1.0/26", "176.0.2.0/26", "176.0.3.0/26"]
    database_subnets = ["176.0.7.0/26", "176.0.8.0/26"]
}