data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "saguro-training-aws"
    key = "rapid/dev/vpc/terraform.tfstate"
  }
}

resource "aws_security_group" "sg_webserver" {
  
  name = "all_ssh_http"
  description = "Allow ssh http"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]

  }

  ingress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

resource "aws_instance" "webserver" {
  ami           = "ami-050eee766e626a40a"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = [ aws_security_group.sg_webserver.id ]
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnets1

  tags = {
    Name = "webserver-${var.enviromment_name}"
  }
}