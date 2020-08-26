module "create_vpc" {
  source = "../modules/vpc"
  environment = "dev"
  vpc_name = "dev-vpc"
  vpc_cidr = "192.168.1.0/26"
  vpc_tenancy = "default"
  vpc_id = "${module.create_vpc.vpc_id}"
  igw_name = "dev-vpc-igw"
  public_subnet = [ "192.168.1.0/28"]
  public_subnet_az = [ "ap-south-1a" ]
  private_subnet = [ "192.168.1.16/28", "192.168.1.32/28" ]
  private_subnet_az = [ "ap-south-1b", "ap-south-1c" ]
}
