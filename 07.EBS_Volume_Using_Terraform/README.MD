For this task, create an AWS EBS volume using Terraform with the following requirements:

Name of the volume should be nautilus-volume.

Volume type must be gp3.

Volume size must be 2 GiB.

Ensure the volume is created in us-east-1.

Solution:

Availability Zone: EBS volumes must be created in a specific AZ, not just a region.  is a common choice, but you can change it based on your EC2 instance's AZ.
• 	Size: 2 GiB as requested.
• 	Type:  is the latest general-purpose SSD offering.
• 	Tag: Naming the volume  for easy identification.
