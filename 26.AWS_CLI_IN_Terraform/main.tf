resource "null_resource" "s3_backup_and_delete" {
  provisioner "local-exec" {
    command = <<EOT
      # Create backup directory
      mkdir -p /opt/s3-backup/

      # Sync S3 bucket contents to local directory
      aws s3 sync s3://devops-bck-12895 /opt/s3-backup/

      # Delete all objects in the bucket
      aws s3 rm s3://devops-bck-12895 --recursive

      # Delete the bucket itself
      aws s3api delete-bucket --bucket devops-bck-12895
    EOT
  }
}