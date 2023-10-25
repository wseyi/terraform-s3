
resource "aws_s3_bucket" "assignment" {
  bucket = var.bucket

  tags = {
    Name        = var.Name
    Environment = var.Environment
  }
}