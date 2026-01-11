resource "aws_s3_bucket" "buckets3-eks" {
  bucket = var.bucket_name_backend
  region = var.region
  tags = var.tags_prod
  force_destroy = true
  lifecycle {
    prevent_destroy = false
    ignore_changes  = [bucket]
  }
}