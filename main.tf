terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "rand_id" {
  byte_length = 9

}

resource "aws_s3_bucket" "my-website-bucket" {
  bucket = "jay-pal-${random_id.rand_id.hex}"
}


resource "aws_s3_bucket_public_access_block" "my-website-bucket" {
  bucket = aws_s3_bucket.my-website-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "mywebapp" {
  bucket = aws_s3_bucket.my-website-bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.my-website-bucket.id}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "my-webapp" {
  bucket = aws_s3_bucket.my-website-bucket.id

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.my-website-bucket.bucket
  source = "./index.html"
  key    = "index.html"
  content_type = "text/html"
  
}

resource "aws_s3_object" "style_css" {
  bucket = aws_s3_bucket.my-website-bucket.bucket
  source = "./style.css"
  key    = "style.css"
  content_type = "text/css"

}
output "name" {
  value = aws_s3_bucket_website_configuration.my-webapp.website_endpoint

}
