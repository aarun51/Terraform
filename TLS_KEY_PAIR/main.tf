provider "tls" {}

resource "tls_private_key" "xfusion_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key_file" {
  content  = tls_private_key.xfusion_key.private_key_pem
  filename = "/home/bob/xfusion-kp.pem"
  file_permission = "0600"
}