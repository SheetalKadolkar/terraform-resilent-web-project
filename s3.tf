# S3 Bucket
resource "aws_s3_bucket" "site_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "public" {
  bucket                  = aws_s3_bucket.site_bucket.id
  block_public_acls       = false
  block_public_policy     = false  
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.site_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = ["s3:GetObject"],
      Resource  = "${aws_s3_bucket.site_bucket.arn}/*"
    }]
  })
}

# SNS Topic for bucket notifications
resource "aws_sns_topic" "s3_topic" {
  name = "${var.project}-s3-topic"
}

# Allow S3 to publish to SNS
resource "aws_sns_topic_policy" "allow_s3_publish" {
  arn    = aws_sns_topic.s3_topic.arn
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "s3.amazonaws.com" },
      Action    = "SNS:Publish",
      Resource  = aws_sns_topic.s3_topic.arn,
      Condition = { ArnLike = { "aws:SourceArn" = aws_s3_bucket.site_bucket.arn } }
    }]
  })
}

# S3 bucket notification
resource "aws_s3_bucket_notification" "notify" {
  bucket = aws_s3_bucket.site_bucket.id

  topic {
    topic_arn = aws_sns_topic.s3_topic.arn
    events    = ["s3:ObjectCreated:*"]
  }

  depends_on = [
    aws_sns_topic.s3_topic,
    aws_sns_topic_policy.allow_s3_publish
  ]
}
