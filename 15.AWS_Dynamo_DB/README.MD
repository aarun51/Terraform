The Nautilus DevOps team needs to set up a DynamoDB table for storing user data. They need to create a DynamoDB table with the following specifications:

1) The table name should be datacenter-users.

2) The primary key should be datacenter_id (String).

3) The table should use PAY_PER_REQUEST billing mode.


What This Does
• 	Table Name: 
• 	Primary Key:  of type 
• 	Billing Mode:  (no need to specify read/write capacity)
• 	Tags: Optional metadata for clarity and cost tracking

Terraform will perform the following actions:

  # aws_dynamodb_table.datacenter_users will be created
  + resource "aws_dynamodb_table" "datacenter_users" {
      + arn              = (known after apply)
      + billing_mode     = "PAY_PER_REQUEST"
      + hash_key         = "datacenter_id"
      + id               = (known after apply)
      + name             = "datacenter-users"
      + read_capacity    = (known after apply)
      + stream_arn       = (known after apply)
      + stream_label     = (known after apply)
      + stream_view_type = (known after apply)
      + tags             = {
          + "Environment" = "DevOps"
          + "Team"        = "Nautilus"
        }
      + tags_all         = {
          + "Environment" = "DevOps"
          + "Team"        = "Nautilus"
        }
      + write_capacity   = (known after apply)

      + attribute {
          + name = "datacenter_id"
          + type = "S"
        }

      + point_in_time_recovery (known after apply)

      + server_side_encryption (known after apply)

      + ttl (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take
exactly these actions if you run "terraform apply" now.

