resource "aws_ebs_volume" "nautilus" {
  availability_zone = "us-east-1a"  # Choose an AZ within us-east-1
  size              = 2
  type              = "gp3"
  tags = {
    Name = "nautilus-volume"
  }
}