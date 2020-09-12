## Default variable declartion ##
variable "ssh_key_name" {
  type = string
  default = "dev"
}

variable "ssh_public_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXlKgvl+zfU6ShKIvas5fBEPKv36Wdnqw5XIN7bGpSXuhK/EABzTtwaULMdg4RfkqZrAPWLFkr8aHFr9ZKmaT2lyQN2G5hVoFOBzaEnbYOQgF/u1abRgs+qbLKYVaRWwxB4lHaabkz+9ozCDv07kJ//5jWtgGUhGi4e/Ee71gYyt5VVyiuV/2vXKqSd66J8mMZ4tsZMewcwulUM4lrsO3a22pE0v5uH7dSiH90uRzlNA8M6MuRa+YhR+/G8dXxZr1Pw4ABgHF09SHwGFB57cNsQJYFgFur2DsDe2Dlo5XhFmP9m8MgBZmusC9al8o1HHBn0dz250ZjFI6uXqPukWAL ram@ramsaran"
}

variable "no_of_ec2_instances" {
  type = number
  default = 1
}
variable "ec2_ami_id" {
  type = string
  default = "ami-052c08d70def0ac62"
}

variable "ec2_instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2_public_ip" {
  default = false
}

variable "ec2_az" {
  type = string
  default = "ap-south-1a"
}
variable "subnet_id" { }

variable "sg" {
  type = list(string)
  default = [ "dev-sg" ]
}

variable "remote_commands" {
  type = list(string)
  default = [ "sudo yum update -y"]
}