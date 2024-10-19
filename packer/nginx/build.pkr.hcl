build {
    sources = ["source.amazon-ebs.ubuntu"]

    provisioner "ansible" {
        playbook_file = "./playbook.yml"
    }
}