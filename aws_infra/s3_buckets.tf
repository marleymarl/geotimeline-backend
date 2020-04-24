resource "aws_s3_bucket" "main" {
  bucket = var.project_name
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  versioning {
    enabled = false
  }

  lifecycle_rule {
    enabled = true

    noncurrent_version_expiration {
      days = 90
    }
  }

  tags = {
    terraformed = "true"
  }
}

resource "aws_s3_bucket" "app" {
  bucket = "app.${var.project_name}"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  versioning {
    enabled = false
  }

  lifecycle_rule {
    enabled = true

    noncurrent_version_expiration {
      days = 90
    }
  }

  tags = {
    terraformed = "true"
  }
}
