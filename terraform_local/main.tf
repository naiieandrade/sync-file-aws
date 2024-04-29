provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "up_report_bucket" {
  bucket = var.name_bucket
  count  = var.create_bucket_s3 ? 1 : 0
}
