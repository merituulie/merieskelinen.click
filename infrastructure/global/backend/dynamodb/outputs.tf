output "dynamodb_table_name" {
  value       = aws_dynamodb_table.eskelinen-state-db.name
  description = "The name of the DynamoDB table"
}