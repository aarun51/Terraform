# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.nano"
  subnet_id     = ""
  vpc_security_group_ids = [
    "sg-c2024982210ef6962"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}

output "nautilus_instance_state" {
  value = aws_instance.ec2.instance_state
}