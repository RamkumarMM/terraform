resource "aws_vpc" "main" {
  cidr_block = "192.168.1.0/26"
  instance_tenancy = "default"
  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "192.168.1.0/28"
  vpc_id = aws_vpc.main.id
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "subnet2" {
  cidr_block = "192.168.1.16/28"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private-subnet"
  }
}


data "aws_subnet_ids" "main" {
  vpc_id = aws_vpc.main.id
}

output "available_subnets" {
  value = data.aws_subnet_ids.main.ids
}

#####################################

resource "aws_instance" "main" {
  ami = "ami-052c08d70def0ac62"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet2.id
}