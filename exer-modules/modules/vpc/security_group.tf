## Code to create security group ##
resource "aws_security_group" "dymanic_sg" {
  name = var.sg_name
  description = "Inbound & Outbound Rules"
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = [
        "0.0.0.0/0"]
    }
  }

  /*dynamic "egress" {
    for_each = var.sg_egress_ports
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = [
        "0.0.0.0/0"]
    }
  }*/
}