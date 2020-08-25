## Code to iterate public subnet creation ##
resource "aws_subnet" "public_sbt" {
  count = length(var.public_subnet)
  cidr_block = var.public_subnet[count.index]
  availability_zone = var.public_subnet_az[count.index]
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${substr(var.public_subnet[count.index], 0, 9)}_${var.environment}-PUBLIC-SUBNET_${var.public_subnet_az[count.index]}"
  }
}

## Code to iterate public subnet creation ##
resource "aws_subnet" "private_sbt" {
  count = length(var.private_subnet)
  cidr_block = var.private_subnet[count.index]
  availability_zone = var.private_subnet_az[count.index]
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${substr(var.private_subnet[count.index], 0, 9)}_${var.environment}-PRIVATE_SUBNET_${var.private_subnet_az[count.index]}"
  }
}