output "user_id" {
  value       = aws_iam_access_key.access_key.id
  description = "Id of the upload user"
}

output "user_secret" {
  value       = aws_iam_access_key.access_key.secret
  description = "Secret of the upload user"
}