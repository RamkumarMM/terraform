module "create_vpc" {
  source = "../modules/vpc"
  vpc_name = "dev-vpc"
  vpc_network = "10.16.0.0/16"
  vpc_tenancy = "default"
  vpc_id = "${module.create_vpc.vpc_id}"
  igw_name = "dev-vpc-igw"
  public_subnet = [ "10.16.1.0/24"]
  public_subnet_az = [ "ap-south-1a" ]
  private_subnet = [ "10.16.2.0/24", "10.16.3.0/24" ]
  private_subnet_az = [ "ap-south-1b", "ap-south-1c" ]
}