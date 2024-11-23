# Packer configuration in HCL format
packer {
  # Define the required plugins for this template
  required_plugins {
    # Define the Amazon EBS plugin
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }

    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}