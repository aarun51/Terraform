# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  subnet_id     = "subnet-e8f967738eb7df18b"
  vpc_security_group_ids = [
    "sg-9095943fc584ece13"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}
