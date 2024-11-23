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
  associate_public_ip_address = true
  tags = {
    Name = "AmazonLinux-Jenkins-Docker"
  }

  vpc_id = "vpc-0790dc273515d0733"

  # Subred dentro de la VPC donde se lanzará la instancia
  subnet_id = "subnet-0a32d97d501c8cd4b"
}