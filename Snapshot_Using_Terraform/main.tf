resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name        = "xfusion-vol"
  }
}

resource "aws_ebs_snapshot" "xfusion-vol-ss" {
  volume_id = aws_ebs_volume.k8s_volume.id
  description = "Xfusion Snapshot"
  tags = {
    Name = "xfusion-vol-ss"
  }
}

data "aws_ebs_snapshot" "xfusion" {
  most_recent = true
 
  filter {
    name   = "status"
    values = ["completed"]
  }
  
}