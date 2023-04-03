# You can use precondition blocks to specify guarantees about output data. 
# The following examples creates a precondition that checks whether the EC2 instance has an encrypted root volume.
output "api_base_url" {
  value = "https://${aws_instance.example.private_dns}:8433/"

  # The EC2 instance must have an encrypted root volume.
  precondition {
    condition     = data.aws_ebs_volume.example.encrypted
    error_message = "The server's root volume is not encrypted."
  }
}

# An output can be marked as containing sensitive material using the optional sensitive argument:
output "db_password" {
  value       = aws_db_instance.db.password
  description = "The password for logging in to the database."
  sensitive   = true
}

# The depends_on argument should be used only as a last resort. 
# When using it, always include a comment explaining why it is being used, 
# to help future maintainers understand the purpose of the additional dependency.
output "instance_ip_addr" {
  value       = aws_instance.server.private_ip
  description = "The private IP address of the main server instance."

  depends_on = [
    # Security group rule must be created before this IP address could
    # actually be used, otherwise the services will be unreachable.
    aws_security_group_rule.local_access,
  ]
}