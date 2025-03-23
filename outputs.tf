output "rds_idenfier" {
  description = "The identifier of the RDS instance"
  value       = aws_db_instance.postgres.identifier
}

output "rds_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.postgres.endpoint
}