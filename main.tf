provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
tags = {
Name = "Terraform_instance"
}

user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install httpd -y
  systemctl start httpd
  systemctl enable httpd
  echo "Hello, World!" > /var/www/html/index.html
EOF

ami = "ami-04aa00acb1165b32a"
instance_type = "t2.micro"
security_groups = [aws_security_group.ec2_sg.name]
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Allow SSH, HTTP, and HTTPS traffic"

  # Allow SSH access from your IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Replace with your IP for better security
  }

  # Allow HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS access
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"   # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-security-group"
  }
}
