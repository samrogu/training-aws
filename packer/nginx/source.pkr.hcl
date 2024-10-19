source "amazon-ebs" "ubuntu" {
    region  = "us-east-2"
    instance_type = "t2.micro"
    source_ami = "ami-0ea3c35c5c3284d82"
    ssh_username = "ubuntu"
    ami_name = "custom-ami-nginx-${regex_replace(timestamp(), "[- TZ:]", "")}"

    tags = {
        Environment     = "prod"
        Name            = "nginx-gold-${regex_replace(timestamp(), "[- TZ:]", "")}"
        PackerBuilt     = "true"
        PackerTimestamp = regex_replace(timestamp(), "[- TZ:]", "")
        Service         = "nginx"
    }
}