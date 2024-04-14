provider aws {
    region = var.region
}

resource "aws_vpc" "kaizen" {
  cidr_block = var.vpc_cidr
  # enable_dns_support   = var.vpc_dns[0].dns_sup
  # enable_dns_hostnames = var.vpc_dns[0].dns_host
  
}

resource "aws_subnet" "pb1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_crdt[0].cidr
  map_public_ip_on_launch= true
  availability_zone = "${var.region}a"

  tags = {
    Name = var.subnet_crdt[0].subnet_name
  }
}

resource "aws_subnet" "pb2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_crdt[1].cidr
  map_public_ip_on_launch= true
  availability_zone = "${var.region}b"

  tags = {
    Name = var.subnet_crdt[1].subnet_name
    }

}

resource "aws_subnet" "pr1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_crdt[2].cidr
  map_public_ip_on_launch= false
  availability_zone = "${var.region}c"

  tags = {
    Name = var.subnet_crdt[2].subnet_name
  }
}

resource "aws_subnet" "pr2" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet_crdt[3].cidr
  map_public_ip_on_launch= false 
  availability_zone = "${var.region}d"

  tags = {
    Name = var.subnet_crdt[3].subnet_name
}
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
    Name =var.rt_public
  }
}

resource "aws_route_table" "pr-rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  
  tags = {
    Name = var.rt_private
  }
}

resource "aws_route_table_association" "pb-gr1" {
  subnet_id      = aws_subnet.pb1.id
  route_table_id = aws_route_table.pb-rt.id
}


resource "aws_route_table_association" "pb-gr2" {
  subnet_id      = aws_subnet.pb2.id
  route_table_id = aws_route_table.pb-rt.id
}

resource "aws_route_table_association" "pr-gr1" {
  subnet_id      = aws_subnet.pr1.id
  route_table_id = aws_route_table.pr-rt.id
}

resource "aws_route_table_association" "pr-gr2" {
  subnet_id      = aws_subnet.pr2.id
  route_table_id = aws_route_table.pr-rt.id
}




