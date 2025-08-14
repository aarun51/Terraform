To create an IAM policy named  in the  region using Terraform that grants read-only access to the EC2 console, you'll need to define a policy document that includes permissions for viewing EC2 instances, AMIs, and snapshots.



Policy Name: 

• 	Region: 

• 	Permissions:

• 	: View EC2 instances

• 	: View AMIs

• 	: View EBS snapshots

• 	Additional  actions to support full EC2 console visibility



Terraform will perform the following actions:



&nbsp; # aws\_iam\_policy.ec2\_readonly will be created

&nbsp; + resource "aws\_iam\_policy" "ec2\_readonly" {

&nbsp;     + arn              = (known after apply)

&nbsp;     + attachment\_count = (known after apply)

&nbsp;     + description      = "Read-only access to EC2 console: view instances, AMIs, and snapshots"

&nbsp;     + id               = (known after apply)

&nbsp;     + name             = "iampolicy\_ammar"

&nbsp;     + name\_prefix      = (known after apply)

&nbsp;     + path             = "/"

&nbsp;     + policy           = jsonencode(

&nbsp;           {

&nbsp;             + Statement = \[

&nbsp;                 + {

&nbsp;                     + Action   = \[

&nbsp;                         + "ec2:DescribeInstances",

&nbsp;                         + "ec2:DescribeImages",

&nbsp;                         + "ec2:DescribeSnapshots",

&nbsp;                         + "ec2:DescribeVolumes",

&nbsp;                         + "ec2:DescribeSecurityGroups",

&nbsp;                         + "ec2:DescribeKeyPairs",

&nbsp;                         + "ec2:DescribeTags",

&nbsp;                         + "ec2:DescribeAddresses",

&nbsp;                         + "ec2:DescribeAvailabilityZones",

&nbsp;                         + "ec2:DescribeRegions",

&nbsp;                         + "ec2:DescribeInstanceStatus",

&nbsp;                         + "ec2:DescribeNetworkInterfaces",

&nbsp;                       ]

&nbsp;                     + Effect   = "Allow"

&nbsp;                     + Resource = "\*"

&nbsp;                     + Sid      = "EC2ReadOnlyAccess"

&nbsp;                   },

&nbsp;               ]

&nbsp;             + Version   = "2012-10-17"

&nbsp;           }

&nbsp;       )

&nbsp;     + policy\_id        = (known after apply)

&nbsp;     + tags\_all         = (known after apply)

&nbsp;   }



Plan: 1 to add, 0 to change, 0 to destroy.



