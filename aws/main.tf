# aws config file with dynamic ingress rules
resource "aws_security_group" "connections" {
  name        = var.sg_name
  # ingress {
  #   description      = "TLS from VPC"
  #   from_port        = 443
  #   to_port          = 443
  #   protocol         = "tcp"
  #   cidr_blocks      = [aws_vpc.main.cidr_block]
  #   ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  # }

  # Create multiple ingress rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    content { 
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
    }
  }
}

# resource_type resource_name
resource "aws_instance" "example" {
  instance_type = var.instance_type
  ami           = var.ami
  tags          = var.tags
  security_groups = ["${aws_security_group.connections.name}"]
}