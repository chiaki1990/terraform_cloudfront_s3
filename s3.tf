
resource "aws_s3_bucket" "bucket" {
  bucket = local.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
  # privateにしたら使えなくなるかも 後で検証したい
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = file("s3_bucket_policy.json")
}
