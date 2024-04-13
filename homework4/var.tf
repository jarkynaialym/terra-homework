variable "region" {
   type= string  
}

variable "aws_ami" {
  type = string 
}

variable "instance_type" {
  type = string
}

variable "availability_zone" {
  type = list(string)
}


variable "ports" {
  type = list(number)
  
}


variable "key" {
  type= string
}


variable "count_ins" {
  type = number
  default = 1
}