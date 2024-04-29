variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"

}

variable "aws_profile" {
  type        = string
  default     = "default"
  description = "AWS Profile"

}

# variable "name_bucket_to_tfstate" {
#   type        = string
#   default = "bucket-tosave-tfstate-upreports"
#   description = "Name bucket to save tfstate file"

# }

variable "create_bucket_tfstate" {
  type    = bool
  default = true
}

variable "create_bucket_s3" {
  type    = bool
  default = true
}

## Undo comment in these vars to run locally 
## Create tfvars file and put values

# variable "access_key_id" {
#   type        = string
#   description = "Access Key ID AWS"

# }

# variable "secret_key_id" {
#   type        = string
#   description = "Secret Key ID AWS"

# }
