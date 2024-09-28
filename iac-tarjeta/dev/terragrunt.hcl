include {
    path = find_in_parent_folders()
}


generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  bbackend "s3" {
        bucket = "saguro-training-aws"
        key = "rapid/dev/vpc/terraform.tfstate" 
        region = "us-east-2"
    }
}
EOF
}

inputs = {
    product = "banca-digital-dev"
}