resource "aws_vpc" "main" {
  cidr_block = var.vpc_network
  instance_tenancy = var.vpc_tenancy

  tags = {
    Name = var.vpc_name
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}