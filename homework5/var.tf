region   = "us-east-1"
vpc_cidr= "192.168.0.0/16"
igw_name = "homework5_igw"
subnet_crdt = [
  { cidr = "192.168.1.0/24" , subnet_name =  "public1" },
  { cidr =  "192.168.2.0/24" , subnet_name = "public2" },
  { cidr = "192.168.101.0/24" , subnet_name = "private1"},
  {cidr = "192.168.102.0/24" , subnet_name = "private2" }
]

rt_public= "public-rt"
rt_private = "private-rt"

ec2_crdt = [ 
  {instance_name = "ubuntu", instance_type = "t2.micro" },
  {instance_name = "amazon", instance_type = "t2.micro" }
 ]
ports = [22, 80]





variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "igw_name" {
  type = string
}


variable "subnet_crdt" {
  type = list(object({
    cidr= string
    subnet_name = string
  }))
  
}

variable "rt_public" {
  type = string
}

variable "rt_private" {
  type = string
}

variable "ec2_crdt" {
  type = list(object({
    instance_type = string
    instance_name = string
  }))
  
}

variable "ports" {
  type = list(string)
}