## Creating route for Internet Access ##
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "dev-vpc-rtb"
  }
}

## Associating public subnet to internet access route table ##
resource "aws_route_table_association" "internet_access" {
  count = length(var.public_subnet_cidr)
  subnet_id      =  aws_subnet.public_sbt[count.index].id
  route_table_id = aws_route_table.main.id
}