# definition of the aws instance we will handle
resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = var.image_id
}