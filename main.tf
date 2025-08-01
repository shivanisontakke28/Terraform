provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "s3_instance" {
    instance_type = "t2.micro"
    ami = "ami-020cba7c55df1f615"
    subnet_id = "subnet-0c25b1e61d6816097"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "sontakke-shivu-xyz"
}