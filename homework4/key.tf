resource "aws_key_pair" "allow_tls" {
  key_name   = var.key
  public_key = file("~/.ssh/id_rsa.pub")

}