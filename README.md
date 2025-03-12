# Terraform and Jenkins CI/CD for AWS EC2 Deployment
This project automates the provisioning of an AWS EC2 instance and deployment of a web server using Terraform and Jenkins CI/CD pipeline.
 
# Setup Process
# 1. Setup Terraform
Installed Terraform on the local machine.
Created a main.tf file to define AWS infrastructure:
AWS EC2 instance using ami-04aa00acb1165b32a
Security group for SSH, HTTP, and HTTPS access
User data to install and start a web server
# 2. Setup Jenkins
Installed Jenkins and required plugins (Pipeline, Terraform, GitHub).
Configured AWS credentials in Jenkins.
# 3. Create Jenkins Pipeline
Created a Jenkinsfile with the following stages:
Checkout Code – Cloned Terraform code from GitHub
Terraform Init – Initialized Terraform backend
Terraform Plan – Generated an execution plan
Terraform Apply – Applied the Terraform configuration
Post Actions – Notified on success or failure
# 4. Terraform Execution
terraform import aws_security_group.ec2_sg sg-12345678
Applied Terraform code using Jenkins pipeline.
Successfully created EC2 instance and web server.
# 5. Validation
Verified the EC2 instance and web server using public IP.
Checked CloudWatch for monitoring.
# Outcome:
Successful provisioning of AWS infrastructure using Terraform.
Automated deployment using Jenkins CI/CD.
EC2 instance running a web server accessible via public IP.
