# definition of the variables we will use

# basic
variable "instance" {
  type        = string
  default     = "some-instance-value"
  description = "description-of-this-value"
}

variable "ami" {
  type        = string
  default     = "some-default-value"
  description = "description-of-this-value"
}

# with validation
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  nullable    = false

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

# map
variable "user_information" {
  type = object({
    name    = string
    address = string
  })
  nullable  = false
  sensitive = true
}

# list of strings
variable "availability_zone_names" {
  type      = list(string)
  default   = ["us-west-1a"]
}

# list of objects
variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 8300
      external = 8300
      protocol = "tcp"
    }
  ]
}