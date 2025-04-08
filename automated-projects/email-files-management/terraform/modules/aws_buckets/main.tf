# ===================================
# Author: @aglorhythm
# Create AWS buckets
# ===================================


# create buckets
resource "aws_s3_bucket" "private_content_buckets" {
  count  = length(var.business_buckets)
  bucket = var.business_buckets[count.index]

  tags   = {
    Name  = var.business_buckets[count.index]
    Environment = var.environment
  }
}
