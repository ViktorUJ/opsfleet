resource "random_string" "s3_prefix" {
  length  = 10
  special = false
  number  = false
  upper   = false
}


resource "aws_s3_bucket" "s3" {
  bucket        = "${var.aws}-${var.prefix}-${random_string.s3_prefix.result}"
  acl           = "private"
  force_destroy = "true"
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "DELETE"]
    allowed_origins = ["*"]
  }
}



resource "aws_iam_policy" "s3" {
  name        = "${var.aws}-${var.prefix}-${random_string.s3_prefix.result}"
  path        = "/"
  description = ""
  policy      = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "${aws_s3_bucket.s3.arn}",
                "${aws_s3_bucket.s3.arn}/*"

            ]
        },
       {
         "Effect":"Allow",
         "Action":[
            "s3:ListAllMyBuckets"

         ],
         "Resource":[
            "arn:aws:s3:::*"
         ]
       }

    ]
}
POLICY
}

