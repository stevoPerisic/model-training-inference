provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "gpu_instance" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "p4d.24xlarge"
  count         = 2

  tags = {
    Name = "GPU-Instance"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

resource "aws_iam_role" "model_access_role" {
  name = "ModelAccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
