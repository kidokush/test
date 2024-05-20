resource "local_file" "public_key" {
  content  = aws_key_pair.tf-key.public_key
  filename = var.public_key_filename
}

resource "aws_key_pair" "tf-key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = var.private_key_filename
}
