provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-kvbucket"
    key    = "ami/shipping/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ami" {
  source = "github.com/krishnavamsi7616/immutable-app-ami"
  COMPONENT = "shipping"
  APP_VERSION = var.APP_VERSION
  vpc_id      = var.VPC_ID
}

variable "APP_VERSION" {}
variable "VPC_ID" {}