
output "public_ip" {
  # value = <instance_type>.<instance_name>.<property>
  value = aws_instance.example.*.public_ip
}