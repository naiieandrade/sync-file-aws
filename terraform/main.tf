terraform {
  required_version = "0.14.4"

  backend "s3" {
    bucket         = "myawsbucket-s3-ada" #"myawsbucket-s3-ada" #bucket para arquivo do terraform
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "upreports-tabela-dynamodb-para-lock"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "up_report_bucket" {
  count = length(aws_s3_bucket.up_report_bucket) == 0 ? 1 : 0
  bucket = "up_report_bucket"
}


# terraform {
#     required_version = "0.14.4"

#     required_providers {
#       source = "hashicorp/aws"
#       version = "3.23.0"
#     }
# }

# # Define AWS provider and region
# provider "aws" {
#     region = var.aws_region
#     profile = var.aws_profile
#     access_key = var.access_key_id
#     secret_key = var.secret_key_id
# }

# # Create a S3 bucket 
# resource "aws_s3_bucket" "up_report_bucket" {
#   bucket = up_report_bucket #"ada-bucket-6"
# }



# resource "aws_instance" "application" {
#     ami = var.instance_ami
#     instance_type = var.instance_type
#     tags = var.instance_tags
  
# }




