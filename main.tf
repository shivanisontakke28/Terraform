provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://3.86.241.29:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "e4550dae-36ba-0dc3-00ed-6c1aee71f53f"
      secret_id = "4bd74027-63f8-6bd8-5c97-796bc663f61a"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "ec2_instance" {
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"

  tags = {
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "vault-inti-s3-xyz-buc-ket"

  tags = {
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
