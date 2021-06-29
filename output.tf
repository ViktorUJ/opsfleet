output "s3_bucket" {
  value = aws_s3_bucket.s3.bucket
}

output "iam_policy" {
  value = aws_iam_policy.s3.name
}

output "eks_iam_app_role" {
  value = aws_iam_role.eks-app-WebIdentity.name
}