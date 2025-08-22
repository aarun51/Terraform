1) Delete the ec2 instance named xfusion-ec2 present in us-east-1 region using terraform. Make sure to keep the provisioning code, as we might need to provision this instance again later.

2) Before submitting your task, make sure instance is in terminated state.

The Terraform working directory is /home/bob/terraform.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

---------------------------------------------------

To delete the EC2 instance named `xfusion-ec2` using Terraform while **preserving the provisioning code** for future use, you'll simply need to **comment out or temporarily disable** the resource block in your `main.tf` file. This way, Terraform will destroy the instance but retain the code for later re-provisioning.

---

### ✅ Step-by-Step Instructions

#### 1. **Comment out the EC2 resource block**

In `/home/bob/terraform/main.tf`, wrap the EC2 block in a multiline comment like this:

```hcl
/*
# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-73d41c6663dedfc67"
  ]

  tags = {
    Name = "xfusion-ec2"
  }
}
*/
```

This tells Terraform to **remove the instance** from its state but **keep the code** intact.

---

#### 2. **Run Terraform commands**

Open the terminal in VS Code and execute:

```bash
cd /home/bob/terraform
terraform init
terraform apply
```

Terraform will detect that the EC2 resource is no longer defined and prompt you to **destroy** it. Confirm with `yes`.

---

#### 3. **Verify termination**

After `terraform apply` completes, confirm the instance is terminated:

```bash
aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=xfusion-ec2" \
  --region us-east-1 \
  --query "Reservations[*].Instances[*].State.Name" \
  --output text
```

You should see:

```
terminated
```

---


