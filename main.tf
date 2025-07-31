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
}
