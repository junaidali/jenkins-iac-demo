terraform {
  required_version = ">= 0.12.2"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = var.region
}

locals {
  bucket_name = lower("${var.project}-united-poc-iac-demo-${var.environment}")
}

resource "aws_s3_bucket" "storage_bucket" {
  bucket = local.bucket_name
  acl    = "private"

  tags = {
    Name        = "${local.bucket_name}"
    Environment = "${var.environment}"
  }
}
