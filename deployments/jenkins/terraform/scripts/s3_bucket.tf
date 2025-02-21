provider "aws" {
  region = "eu-west-3"
}

# Ressources ---------------------------------------------

# -- S3 Bucket  
resource "aws_s3_bucket" "bucket_1" {

  bucket  = "tfstate-jenkins"
}

# -- S3 Bucket Public access rules

resource "aws_s3_bucket_ownership_controls" "public" {
  bucket = aws_s3_bucket.bucket_1.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public" {
  bucket = aws_s3_bucket.bucket_1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public" {
  depends_on = [
    aws_s3_bucket_ownership_controls.public,
    aws_s3_bucket_public_access_block.public,
  ]

  bucket = aws_s3_bucket.bucket_1.id
  acl    = "public-read"
}
