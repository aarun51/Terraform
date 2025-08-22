A S3 bucket named devops-bck-12895 already exists.

1) Copy the contents of devops-bck-12895 S3 bucket to /opt/s3-backup/ directory on terraform-client host (the landing host once you load this lab).

2) Delete the S3 bucket devops-bck-12895.

3) Use the AWS CLI through Terraform to accomplish this task—for example, by running AWS CLI commands within Terraform. The Terraform working directory is /home/bob/terraform. Update the main.tf file (do not create a separate .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

-----------------------------------------------------------

To accomplish this task using AWS CLI commands embedded within Terraform, you can use the `null_resource` with `local-exec` provisioners inside your existing `main.tf` file. This allows you to run shell commands (like AWS CLI) during Terraform execution.

Here’s how to update your `main.tf` file to:

1. **Copy contents from the S3 bucket to `/opt/s3-backup/`**
2. **Delete the S3 bucket `devops-bck-12895`**

---

### ✅ Updated `main.tf` Snippet

```hcl
resource "null_resource" "s3_backup_and_delete" {
  provisioner "local-exec" {
    command = <<EOT
      # Create backup directory if it doesn't exist
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
```

---

### 🛠️ Notes

- Ensure the AWS CLI is configured with appropriate credentials and region on the `terraform-client` host.
- This assumes the bucket is in a region compatible with your CLI config. If needed, add `--region <region>` to the commands.
- You can run `terraform apply` from `/home/bob/terraform` to execute this.

---

Would you like help validating the bucket contents before deletion or automating this with a conditional check?
