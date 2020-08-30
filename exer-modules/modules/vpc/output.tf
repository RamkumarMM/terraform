output "vpc_id" {
  value = aws_vpc.main.id
}

output "available_azs" {
  value = data.aws_availability_zones.available_azs.names
}

output "available_subnets" {
  value = data.aws_subnet_ids.available_subnets.ids
}

output "available_sgs" {
  value = aws_security_group.dymanic_sg.id
}

