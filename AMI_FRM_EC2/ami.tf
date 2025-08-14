
# 🔍 Locate EC2 instance by Name tag
data "aws_instance" "xfusion_ec2" {
  filter {
    name   = "tag:Name"
    values = ["xfusion-ec2"]
  }
}

# 📸 Create AMI from the located instance
resource "aws_ami_from_instance" "xfusion_ami" {
  name               = "xfusion-ec2-ami"
  source_instance_id = data.aws_instance.xfusion_ec2.id

  tags = {
    Name = "xfusion-ec2-ami"
  }
}

# ✅ Confirm AMI is available
data "aws_ami" "xfusion_ami_available" {
  depends_on = [aws_ami_from_instance.xfusion_ami]

  owners = ["self"]

  filter {
    name   = "name"
    values = ["xfusion-ec2-ami"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  most_recent = true
}

# 📝 Output AMI ID
output "xfusion_ami_id" {
  value = data.aws_ami.xfusion_ami_available.id
}