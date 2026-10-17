# Terraform Learning

My first steps with **Terraform** — provisioning AWS infrastructure as code. This repo is a small practice project created while learning the basics of Infrastructure as Code (IaC).

## What this project does

The `main.tf` file creates:

- **AWS Provider** configured for a chosen region
- **EC2 instance** (`training_ec2`) — a `t3.micro` instance launched from a specified AMI, tagged for identification
- **Security Group** (`sridhar_sg`) — allows inbound SSH (port 22) and attaches to the EC2 instance

## Project structure

```
Terraform/
├── main.tf                 # Provider + resources (EC2, Security Group)
├── .terraform.lock.hcl     # Provider version lock file
├── .gitignore              # Ignores state files, .terraform/, etc.
└── README.md
```

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- An [AWS account](https://aws.amazon.com/)
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured (`aws configure`)

## Usage

1. **Clone the repo**
   ```bash
   git clone https://github.com/sridhar21433/terraform-learning.git
   cd terraform-learning
   ```

2. **Set your region** in `main.tf` (and use AWS CLI profile / environment variables for credentials — see the security note below).

3. **Initialize Terraform**
   ```bash
   terraform init
   ```

4. **Preview the changes**
   ```bash
   terraform plan
   ```

5. **Apply the configuration**
   ```bash
   terraform apply
   ```

6. **Destroy resources when done** (to avoid AWS charges)
   ```bash
   terraform destroy
   ```

## ⚠️ Security notes

- **Never commit AWS access keys or secret keys** to GitHub. Use `aws configure`, a named profile, or environment variables instead:
  ```bash
  export AWS_ACCESS_KEY_ID="your-key"
  export AWS_SECRET_ACCESS_KEY="your-secret"
  ```
- The security group currently allows SSH from `0.0.0.0/0` (anywhere). This is fine for testing, but restrict it to your own IP in real use.
- Do not commit `terraform.tfstate` files — they can contain sensitive data. Make sure they're in `.gitignore`.

## Key Terraform commands learned

| Command | Purpose |
|---|---|
| `terraform init` | Download providers and initialize the working directory |
| `terraform validate` | Check configuration syntax |
| `terraform fmt` | Format code |
| `terraform plan` | Preview changes |
| `terraform apply` | Create/update infrastructure |
| `terraform destroy` | Tear down infrastructure |

## What I'm learning

- Infrastructure as Code basics
- Providers, resources, and references between resources
- Terraform state
- Managing AWS EC2 and security groups

## Next steps

- [ ] Use variables (`variables.tf`) and outputs (`outputs.tf`)
- [ ] Remote state with S3 backend
- [ ] Modules
- [ ] Multiple environments

---

Happy learning! 🚀
