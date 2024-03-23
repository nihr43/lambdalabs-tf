resource "tls_private_key" "default" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "id_rsa" {
  content         = tls_private_key.default.private_key_openssh
  filename        = "${path.module}/id.rsa"
  file_permission = "0600"
}

resource "lambdalabs_ssh_key" "primary" {
  name       = "terraform"
  public_key = trim(tls_private_key.default.public_key_openssh, "\n")
}

resource "lambdalabs_instance" "default" {
  region_name        = "us-south-1"
  instance_type_name = "gpu_1x_rtx6000"
  ssh_key_names = [
    lambdalabs_ssh_key.primary.name
  ]
}

output "ssh_hint" {
  value = "ssh -i id.rsa ubuntu@${lambdalabs_instance.default.ip}"
}
