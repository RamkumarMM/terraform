## Default Environment declartion ##
variable "environment" {
  type = string
  default = "dev"
}

## Default variable declaration for VPC Creation ##
variable "vpc_name" {
  type = string
  default = "vpc-template"
}

variable "vpc_cidr" {
  type = string
  default = "192.168.1.0/24"
}

variable "vpc_tenancy" {
  type = string
  default = "default"
}

variable "vpc_id" {
  type = string
  default = "vpc_id"
}


## Default varible declaration for Public Subnet Creation ##
variable "public_subnet_cidr" {
  type = list
  default = [ "192.168.1.0/28" ]
}

variable "public_subnet_az" {}

## Default varible declaration for Private Subnet Creation ##
variable "private_subnet_cidr" {
  type = list
  default = [ "192.168.1.0/28" ]
}
variable "private_subnet_az" {}

## Default variable declaration for Inetnet Gateway Creation ##
variable "igw_name" {
  type = string
  default = "default_igw"
}

## Default variable for security group creation ##
variable "sg_name" {
  type = string
  default = "allow_ssh_web"
}
variable "sg_ingress_ports" {
  type = list(number)
  description = "List of ingress ports"
  default = [ 22 ]
}

/*
variable "sg_egress_ports" {
  type = list(number)
  description = "List of egress ports"
  default = [ 22 ]
}
*/