output "ec2_public_ip_addr" {
  value = "${join(",", aws_instance.ec2.*.public_ip)}"
}