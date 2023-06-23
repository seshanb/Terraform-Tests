output "dynamo_db_table" {
  value = aws_dynamodb_table.basic-dynamodb-table.name
}

output "instances" {
   value = data.external.inspector_exists.result.endpoint_exists
}
