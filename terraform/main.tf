terraform {
  

  backend "s3" {
    bucket         = "myawsbucket-s3-ada" #"myawsbucket-s3-ada" #bucket para arquivo do terraform
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    
    
  }
}

# required_version = "1.8.2"  #0.14.4 

# dynamodb_table = "aws_dynamodb_table.terraform_state_lock.name"

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "up_report_bucket" {
  count = var.create_bucket ? 1 : 0
  bucket = "up-reports-project-ada-bucket-25042024"
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




