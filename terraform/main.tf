terraform {
  backend "s3" {
    bucket         = "myawsbucket-s3-ada" 
    key            = "terraform2/terraform.tfstate"
    region         = "us-east-1"    
  }
}

# required_version = "1.8.2"  #0.14.4 

# dynamodb_table = "aws_dynamodb_table.terraform_state_lock.name"

provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = "myawsbucket-s3-ada"

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "up_report_bucket" {
  count = var.create_bucket ? 1 : 0
  bucket = "up-reports-project-ada-bucket-25042024"
}