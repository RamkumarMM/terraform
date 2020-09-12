resource "aws_vpc" "main" {
  cidr_block = "192.168.1.0/26"
  instance_tenancy = "default"
  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "public_subbet" {
  cidr_block = "192.168.1.0/28"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  cidr_block = "192.168.1.16/28"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private-subnet"
  }
}

data "aws_subnet_ids" "sbt" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public-subnet"
  }
}


data "aws_subnet" "destination" {
  count = "${length(data.aws_subnet_ids.sbt.ids)}"
  id = "${tolist(data.aws_subnet_ids.sbt.ids)[count.index]}"
#  for_each = data.aws_subnet_ids.sbt.ids
#  id = each.value
}

data "aws_availability_zones" "azs" {}

output "azs" {
  value = data.aws_availability_zones.azs.names
}
output "available_subnets" {
  value = data.aws_subnet_ids.sbt.ids
}

#####################################

resource "aws_instance" "main" {
  ami = "ami-052c08d70def0ac62"
  instance_type = "t2.micro"
  subnet_id = element(tolist(data.aws_subnet_ids.sbt.ids),0)
}
