provider "aws" {
  region = "us-west-2"

  default_tags { # Update your default tags with your own values
    tags = {
      Application = "rderik-demo"
      Environment = "shared"
    }
  }
}

terraform {
  backend "s3" {
    region         = "us-west-2"
    bucket         = "rderik-tfstate"
    key            = "shared/tfstate/terraform.tfstate"
    dynamodb_table = "rderik-tfstate"
    encrypt        = true
  }
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "rderik-tfstate"
}

resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_encryption" {
  bucket = aws_s3_bucket.tf_state.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "rderik-tfstate"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

