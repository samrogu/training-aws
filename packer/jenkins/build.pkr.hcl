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

# Define the builder for Amazon EC2 AMI
source "amazon-ebs" "amazon_linux" {
  region           = "us-east-2"
  source_ami_filter {
    filters = {
      "virtualization-type" = "hvm"
      "name"                = "al2023-ami-2023.6.20241111.0-kernel-6.1-x86_64"
      "root-device-type"    = "ebs"
    }
    owners = ["137112412989"]  # Amazon's official AMI account ID
    most_recent = true
  }
  instance_type     = "t2.micro"
  ssh_username      = "ec2-user"
  ami_name          = "amazon-linux-jenkins-docker-packer-terraform-{{timestamp}}"
  ami_description   = "Amazon Linux 2 with Jenkins, Docker, Packer, Terraform, and plugins pre-installed"
  tags = {
    Name = "AmazonLinux-Jenkins-Docker"
  }
}

# Define the provisioner for Ansible
build {
  sources = [
    "source.amazon-ebs.amazon_linux"
  ]
  provisioner "ansible" {
    playbook_file = "jenkins-playbook.yml"
    extra_arguments = [
      "--extra-vars", "ansible_python_interpreter=/usr/bin/python3"
    ]
  }
}
