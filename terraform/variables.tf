variable "aws_region" {
  type        = string
  description = "AWS Region"

}

variable "aws_profile" {
  type        = string
  description = "AWS Profile"

}

variable "access_key_id" {
  type        = string
  description = "Access Key ID AWS"

}

variable "secret_key_id" {
  type        = string
  description = "Secret Key ID AWS"

}

variable "name_bucket" {
  type        = string
  description = "Name bucket"

}

variable "create_bucket" {
  type    = bool
  default = true
}



# variable "instance_ami" {
#   type        = string
#   description = "Instance AMI"

# }

# variable "instance_type" {
#   type        = string
#   description = "Instance type"

# }
