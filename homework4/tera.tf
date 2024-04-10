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
  count = 3
#   vpc_security_group_ids = var.aws_security_group.of_the_ec2.id
  # count = var.count 
  availability_zone = var.availability_zones[count.index]

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

# variable vpc_security_group_ids {
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   default = ""
#   type = string
# }


# variable "count" {
#   description = "Number of instances to create"
#   type        = number
# }
variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

variable "ports" {
  description = "List of ports to open"
  type        = list(number)
}
  