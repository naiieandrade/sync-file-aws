provider "aws" {
  region = "us-east-1"
}

# resource "aws_s3_bucket" "tf_state_bucket" {
#   bucket = "bucket-tosave-tfstate-upreports-ada"
#   count  = var.create_bucket_tfstate ? 1 : 0
#   # bucket_exists = false
  
# }

resource "aws_s3_bucket_cors_configuration" "tfstate_bucket" {
  bucket = "bucket-tosave-tfstate-upreports-ada"
  #"bucket-tosave-tfstate-upreports"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["*"]
    expose_headers  = []
    # max_age_seconds = 3000
  }

  # cors_rule {
  #   allowed_methods = ["GET"]
  #   allowed_origins = ["*"]
  # }
}


# resource "aws_s3_bucket_versioning" "tfstate_versioning" {
#   bucket = "bucket-tosave-tfstate-upreports-ada"
#   # "bucket-tosave-tfstate-upreports" 
#   #var.name_bucket_to_tfstate

#   versioning_configuration {
#     status = "Enabled"
#   }
# }


terraform {
  backend "s3" {
    bucket = "bucket-tosave-tfstate-upreports-ada"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    # encrypt = false
    # dynamodb_table = "aws_dynamodb_table.terraform_state_lock.name"
  }
}

resource "aws_s3_bucket" "up_report_bucket" {
  count  = var.create_bucket_s3 ? 1 : 0
  bucket = "up-reports-project-ada-bucket-29042024"
}