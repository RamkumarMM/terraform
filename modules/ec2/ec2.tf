## Code to create EC2 Instances ##
resource "aws_instance" "ec2" {
  count = var.no_of_ec2_instances
  ami = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  key_name = var.ssh_key_name
  availability_zone = var.ec2_az
  associate_public_ip_address = var.ec2_public_ip
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.sg
}
