resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  force_destroy = var.force_destroy

  tags = {
    Name = var.name
  }
}

resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.bucket.bucket
  versioning_configuration {
    status = var.status
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.bucket

  rule {
    id     = var.id
    status = var.status

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
}

