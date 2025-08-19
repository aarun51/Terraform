resource "aws_s3_bucket" "s3mybucket" {
  bucket = "datacenter-s3-1934"
}

resource "aws_s3_bucket_acl" "s3myacl" {
  bucket = aws_s3_bucket.s3mybucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3mybucket.id
  versioning_configuration {
    status = "Enabled"
  }
}