export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-east-2


#Terraform commands

terraform init
terraform plan
terraform apply

terraform apply -auto-approve

terraform destroy
terraform destroy -auto-approve




# Trabajando con workspaces

terraform workspace list

terraform workspace new ${dev (Define el envirome)} 
Ejemplo: 


terraform workspace new dev
terraform workspace new qa
terraform workspace new prod

terraform workspace select ${enviromment}

terraform workspace select dev





