# Resource: EC2 instance



resource "aws_instance" "myec2vm" {
  ami           = "ami-0742b4e673072066f"
  instance_type = "t3.micro"
  user_data     = file("${path.module}/app1-install.sh")
  subnet_id = "subnet-0b1a89c2737cec15c"


  tags = {
    "Name" = "EC2-Demo"
  }
}