terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      version = "~> 3.0"
    }
  }
}
module "create_vpc" {
  source = "../modules/vpc"
  environment = "dev"
  vpc_name = "dev-vpc"
  vpc_cidr = "192.168.1.0/26"
  vpc_tenancy = "default"
  vpc_id = "${module.create_vpc.vpc_id}"
  public_subnet_cidr = [ "192.168.1.0/28" ]
  public_subnet_az = [ element("${module.create_vpc.available_azs}", 0) ]
  #private_subnet_cidr = [ "192.168.1.16/28", "192.168.1.32/28", "192.168.1.48/28",  ]
  #private_subnet_az = [ element("${module.create_vpc.available_azs}", 0), element("${module.create_vpc.available_azs}", 1), element("${module.create_vpc.available_azs}", 2) ]
  private_subnet_cidr = [ "192.168.1.16/28" ]
  private_subnet_az = [ element("${module.create_vpc.available_azs}", 0) ]
  igw_name = "dev-vpc-igw"
  sg_name = "allow_ssh_web"
  sg_ingress_ports = [ 22, 80, 443 ]
  #sg_egress_ports = [ 22, 80, 443 ]
}

/*
output "azs" {
  value = module.create_vpc.available_azs
}

output "subnets" {
  value = module.create_vpc.available_subnets
}

output "sgs" {
  value = module.create_vpc.available_sgs
}
*/

module "create_ec2" {
  source = "../modules/ec2"
  no_of_ec2_instances = 1
  ssh_key_name = "dev-terraform-key"
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXlKgvl+zfU6ShKIvas5fBEPKv36Wdnqw5XIN7bGpSXuhK/EABzTtwaULMdg4RfkqZrAPWLFkr8aHFr9ZKmaT2lyQN2G5hVoFOBzaEnbYOQgF/u1abRgs+qbLKYVaRWwxB4lHaabkz+9ozCDv07kJ//5jWtgGUhGi4e/Ee71gYyt5VVyiuV/2vXKqSd66J8mMZ4tsZMewcwulUM4lrsO3a22pE0v5uH7dSiH90uRzlNA8M6MuRa+YhR+/G8dXxZr1Pw4ABgHF09SHwGFB57cNsQJYFgFur2DsDe2Dlo5XhFmP9m8MgBZmusC9al8o1HHBn0dz250ZjFI6uXqPukWAL ram@ramsaran"
  ec2_ami_id = "ami-052c08d70def0ac62"
  ec2_instance_type = "t2.micro"
  ec2_public_ip = true
  ec2_az = "ap-south-1a"
  subnet_id = element(tolist(module.create_vpc.available_subnets),0)
  sg = [ "${module.create_vpc.available_sgs}" ]
  remote_commands = [ "sudo yum install -y nginx", "sudo systemctl start nginx" ]
}

output "ec2_ip" {
  value = module.create_ec2.ec2_public_ip_addr
}

