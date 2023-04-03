variable sg_name {
  type        = string
  nullable    = false
}

variable ingress_rules {
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
  }))
  nullable = false
}

variable instance_type {
  type = string
  nullable = false
}

variable ami {
  type = string
  nullable = false
}

variable tags {
  type = list(object{
    Name = string
    Environment = string
  })
  nullable = false
}
