## Code to iterate public subnet creation ##
resource "aws_subnet" "public_sbt" {
  count = length(var.public_subnet_cidr)
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.public_subnet_az[count.index]
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.environment}-public_${var.public_subnet_cidr[count.index]}"
    Public = true
  }
}

## Code to iterate private subnet creation ##
resource "aws_subnet" "private_sbt" {
  count = length(var.private_subnet_cidr)
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.private_subnet_az[count.index]
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.environment}-private_${var.private_subnet_cidr[count.index]}"
  }
}


