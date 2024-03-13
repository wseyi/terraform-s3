
resource "aws_s3_bucket" "assignment" {
  bucket = var.bucket

  tags = {
    Name        = var.Name
    Environment = var.Environment
  }
}

resource "aws_iam_policy" "root_delete_policy" {
  name        = "root_delete_policy"
  description = "Allows only root user to delete files in S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Action    = [
        "s3:DeleteObject",
        "s3:DeleteObjectVersion",
        "s3:DeleteObjectTagging",
        "s3:DeleteObjectVersionTagging"
      ],
      Resource  = aws_s3_bucket.tf-bucket_bucket.arn,
      Condition = {
        StringEquals = {
          "aws:userid" = "your_root_user_arn"
        }
      }
    }]
  })