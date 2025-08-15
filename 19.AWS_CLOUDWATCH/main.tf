resource "aws_cloudformation_stack" "datacenter_stack" {
  name          = "datacenter-stack"
  template_body = jsonencode({
    Resources = {
      DatacenterBucket = {
        Type = "AWS::S3::Bucket"
        Properties = {
          BucketName = "datacenter-bucket-27585"
          VersioningConfiguration = {
            Status = "Enabled"
          }
        }
      }
    }
  })
}