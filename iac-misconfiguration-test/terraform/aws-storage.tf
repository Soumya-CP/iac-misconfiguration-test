resource "aws_s3_bucket" "public_demo" {
  bucket = "synthetic-iac-public-demo"
  # TESTCASE: IAC-001 Public S3 ACL
  acl = "public-read"
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.public_demo.id
  # TESTCASE: IAC-002 Wildcard public S3 bucket policy
  policy = jsonencode({Version="2012-10-17", Statement=[{Effect="Allow", Principal="*", Action="s3:GetObject", Resource="${aws_s3_bucket.public_demo.arn}/*"}]})
}

# TESTCASE: IAC-003 S3 bucket has no server-side encryption configuration
resource "aws_s3_bucket" "unencrypted" {
  bucket = "synthetic-iac-unencrypted-demo"
}
