resource "aws_s3_bucket" "nautilus-s3-15358" {
  bucket = "nautilus-s3-15358"
  tags = {
    Name        = "nautilus-s3-15358"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "nautilus-s3-15358" {
  bucket = aws_s3_bucket.nautilus-s3-15358.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "nautilus-s3-15358" {
  bucket = aws_s3_bucket.nautilus-s3-15358.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "nautilus-s3-15358" {
  depends_on = [
    aws_s3_bucket_ownership_controls.nautilus-s3-15358,
    aws_s3_bucket_public_access_block.nautilus-s3-15358,
  ]

  bucket = aws_s3_bucket.nautilus-s3-15358.id
  acl    = "public-read"
}