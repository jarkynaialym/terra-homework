# region = "us-east-2"
# igw_name = "homework5_igw"
# rt_names = [
#     {pb_name= "public", pr_name= "private" }
# ]





provider aws {
    region = var.region
}

resource "aws_vpc" "kaizen" {
  cidr_block = 192.168.0.0/16
  enable_dns_support   = var.vpc_dns[0].dns_sup
  enable_dns_hostnames = var.vpc_dns[0].dns_host
  
}

resource "aws_subnet" "pb1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = 192.168.1.0/24
  map_public_ip_on_launch= true
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.rt_names[0].pr_name}1"
  }
}

resource "aws_subnet" "pb2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = 192.168.2.0/24
  map_public_ip_on_launch= true
  availability_zone = ${var.region}b"

  tags = {
    Name = "${var.rt_names[0].pb_name}2"
  }
}


resource "aws_subnet" "pr1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = 192.168.3.0/24
  map_public_ip_on_launch= false
  availability_zone = "${var.region}c"

  tags = {
    Name = "{${var.rt_names[0].pr_name}1"
  }
}

resource "aws_subnet" "pr1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = 192.168.4.0/24
  map_public_ip_on_launch= false 
  availability_zone = "${var.region}d"

  tags = {
    Name = "{${var.rt_names[0].pr_name}2"
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "pb-rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "pr-rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
  }

  
  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "pb-gr1" {
  subnet_id      = aws_subnet.pb1.id
  route_table_id = aws_route_table.pb-rt
}


resource "aws_route_table_association" "pb-gr2" {
  subnet_id      = aws_subnet.pb2.id
  route_table_id = aws_route_table.pb-rt
}

resource "aws_route_table_association" "pr-gr1" {
  subnet_id      = aws_subnet.pr1.id
  route_table_id = aws_route_table.pr-rt
}

resource "aws_route_table_association" "pr-gr2" {
  subnet_id      = aws_subnet.pr2.id
  route_table_id = aws_route_table.pr-rt
}




