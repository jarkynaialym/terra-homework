provider aws {
    region = var.region
}

variable region {
    description = "provide region"
    default = ""
    type = string
}


 

resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.type
  key_name = var.key_name
  count = 1
  availability_zone = var.availability_zone
  security_groups = [aws_security_group.of_the_ec2.id] 
}

variable ami_id {
    description = "Provide ami id"
    default = ""  
    type = string
}

variable type {
    description = "provide ur type"
    default = ""
    type = string
  
}

variable key_name {
  description = "Provide key name"
  default = ""  
   type = string
}



variable instance_count {
  description = "Provided count "
  default = 1
  type = number
  }

variable "availability_zone" {
  description = "Availability Zone"
  default = ""
  type        = string
}

variable "ports" {
  description = "List of ports to open"
  type        = list(number)
}
  