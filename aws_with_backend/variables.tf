variable bucket_name {
  type        = string
  nullable    = false
}

variable acl {
  type        = list(object)
  nullable    = false
}

variable tags {
  type = list(object{
    Name = string
    Environment = string
  })
  nullable = false
}