terraform {
    required_provider {
        aws = {
            source = "hashicrop/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "app_server" {
    ami           = "ami-020cba7c55df1f615"
    instance_tyep = "t2.micro"

    tags = {
        Name = "Terraform-Demo"
    }

    resource "aws_lb" "test_lb" {
        name               = "test-lb-tf"
        internal           = false
        load_balancer_type = "application"
        security_group     = [aws_security_group.lb_sg.id]
        subnets            = [for subnet in aws_subnet.public : subnet.id]

        enable_deletion_protection = true

        access_logd {
            bucket  = aws_s3_bucket.lb_logs.bucket
            prefix  = "test_lb"
            enabled = true
        }

        tags = {
            Environment = "production" 
        }
    }
}
