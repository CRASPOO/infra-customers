data "aws_s3_bucket" "buckets3-eks" {
  bucket = var.bucket_name_backend
  region = "us-east-1"
  tags = var.tags_prod
  force_destroy = true
  lifecycle {
    prevent_destroy = false
    ignore_changes  = [bucket]
  }
}