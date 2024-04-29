terraform {
  backend "s3" {
    bucket = "bucket-tosave-tfstate-upreports"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    # encrypt = false
    # dynamodb_table = "aws_dynamodb_table.terraform_state_lock.name"
  }
}

provider "aws" {
  region = "us-east-1"
}


# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = env.BUCKET_TFSTATE #"bucket-tosave-tfstate-upreports" 
#   #var.name_bucket_to_tfstate

#   versioning_configuration {
#     status = "Enabled"
#   }
# }

resource "aws_s3_bucket" "up_report_bucket" {
  count  = var.create_bucket ? 1 : 0
  bucket = "up-reports-project-ada-bucket-25042024"
}