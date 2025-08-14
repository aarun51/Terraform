
# 🔑 Create RSA Key Pair
resource "tls_private_key" "datacenter_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "datacenter_kp" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter_key.public_key_openssh
}

# 💻 Launch EC2 Instance
resource "aws_instance" "datacenter_ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.datacenter_kp.key_name

  tags = {
    Name = "datacenter-ec2"
  }

  # Attach default security group
  vpc_security_group_ids = [data.aws_security_group.default.id]
}

# 🔍 Get Default Security Group
data "aws_security_group" "default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# 🔍 Get Default VPC
data "aws_vpc" "default" {
  default = true
}

# 📝 Output Private Key (Optional: Save securely!)
output "private_key_pem" {
  value     = tls_private_key.datacenter_key.private_key_pem
  sensitive = true
}