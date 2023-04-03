sg_name = "example_aws_rules"
ingress_rules = [
  # ssh
  {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"] # allow connections from everywhere
  },
  # http
  {
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"] # allow connections from everywhere
  },
  # https
  {
    from_port         = 443
    to_port           = 443
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"] # allow connections from everywhere
  }
]

instance_type = "t2.large"
ami = "ami-some_ami"
tags = {
  Name = "practice-tf-1"
  Environment = "dev"
}