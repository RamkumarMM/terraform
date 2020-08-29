## Data sources to provide dynamic data to code ##

data "aws_availability_zones" "available_azs" {
  state = "available"
}


data "aws_subnet_ids" "available_subnets" {
  vpc_id = var.vpc_id
  filter {
    name = "tag:Public"
    values = [ "true" ]
  }
}