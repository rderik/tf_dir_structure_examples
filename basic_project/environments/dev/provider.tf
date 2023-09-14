provider "aws" {
  region = "us-west-2"

  default_tags { # Update your default tags with your own values
    tags = {
      Application = var.project_id
      Environment = var.environment
    }
  }
}

#terraform {
  #backend "s3" {
    #region         = "us-west-2"
    #bucket         = "rderik-tfstate"
    #key            = "dev/tfstate/terraform.tfstate"
    #dynamodb_table = "rderik-tfstate"
    #encrypt        = true
  #}
#}
