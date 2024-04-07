provider aws {
    region = "us-east-2"
}

data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20240329.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] 
}











resource "aws_instance" "web" {
  ami = data.aws_ami.amzn2.id
  instance_type = "t2.micro"

    availability_zone = "us-east-2a"
    vpc_security_group_ids = [aws_security_group.of_the_ec2.id]
    key_name = aws_key_pair.deployer.key_name
    user_data_replace_on_change = true
    user_data = file("apache.sh")

    tags = {
    Name = "web-1"
  }

}

resource "aws_instance" "web1" {
  ami = data.aws_ami.amzn2.id
  instance_type = "t2.micro"

    availability_zone = "us-east-2b"
    vpc_security_group_ids = [aws_security_group.of_the_ec2.id]
    key_name = aws_key_pair.deployer.key_name
    user_data_replace_on_change = true
    user_data = file("apache.sh")

tags = {
    Name = "web-2"
  }
}

resource "aws_instance" "web2" {
  ami = data.aws_ami.amzn2.id
  instance_type = "t2.micro"

    availability_zone = "us-east-2c"
    vpc_security_group_ids = [aws_security_group.of_the_ec2.id]
    key_name = aws_key_pair.deployer.key_name
    user_data_replace_on_change = true
    user_data = file("apache.sh")

    tags = {
    Name = "web-2"
  }

}
