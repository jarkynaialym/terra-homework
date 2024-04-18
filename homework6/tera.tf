provider aws {
    region = ""
}

resource "aws_key_pair" "allow_tls" {
  key_name   = "hello"
  public_key = file("~/.ssh/id_rsa.pub")

}