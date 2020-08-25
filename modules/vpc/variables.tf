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

variable "vpc_network" {
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
variable "public_subnet" {}
variable "public_subnet_az" {}

## Default varible declaration for Private Subnet Creation ##
variable "private_subnet" {}
variable "private_subnet_az" {}


## Default variable declaration for Inetnet Gateway Creation ##
variable "igw_name" {
  type = string
  default = "default_igw"
}
