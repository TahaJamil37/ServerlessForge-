

variable "vpc-name" {
    default = "DEV_VPC"
  
}

variable "private_subnets" {
  type = number
  default = 3
}

variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "region" {
  
}

variable "aws_profile" {
  
}