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
