provider aws {
  region = var.region
}



resource "aws_instance" "web" {
  ami           = var.aws_ami
  instance_type = var.instance_type    
  availability_zone = var.availability_zone[count.index]
  count = var.count_ins
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = var.key



}