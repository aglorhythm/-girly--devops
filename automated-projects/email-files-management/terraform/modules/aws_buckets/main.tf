# ===================================
# Author: @aglorhythm
# Create AWS bucket and folders
# ===================================


# creates main bucket
resource "aws_s3_bucket" "dev_business_bucket" {
  bucket = "${var.environment}-${var.business_bucket}"

  tags   = {
    Name  = var.business_bucket
    Environment = var.environment
  }
}

# adds ACL
resource "aws_s3_bucket_ownership_controls" "dev_business_bucket_acl" {
  depends_on = [aws_s3_bucket.dev_business_bucket]

  bucket = aws_s3_bucket.dev_business_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


# set up privacy
resource "aws_s3_bucket_acl" "dev_private_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.dev_business_bucket_acl]

  bucket = aws_s3_bucket.dev_business_bucket.id
  acl    = "private"
}

# create objects
resource "aws_s3_object" "dev_business_bucket_obj" {
  depends_on = [aws_s3_bucket.dev_business_bucket]

  count  = length(var.business_folders)
  bucket = "${var.environment}-${var.business_bucket}"
  key    = "${var.business_folders[count.index]}/readme.txt"

  tags   = {
    Name  = var.business_folders[count.index]
    Environment = var.environment
  }
}
