
output "us_east_1_instance_public_ip" {
  value = aws_instance.instance_us_east_1.public_ip
}

output "us_west_2_instance_public_ip" {
  value = aws_instance.instance_us_west_2.public_ip
}

