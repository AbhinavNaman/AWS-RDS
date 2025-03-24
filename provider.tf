provider "aws" {
  region     = var.aws_region
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

data "aws_vpc" "default" {
  default = true
}



data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
resource "aws_key_pair" "example" {
  key_name   = "terraform-rds"
  public_key = var.OPENSSH_PUBLIC_KEY
}

# https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs
# The PostgreSQL provider gives the ability to deploy and configure resources in a PostgreSQL server.

# terraform {
#   required_providers {
#     postgresql = {
#       source = "cyrilgdn/postgresql"
#       version = "1.20.0"
#     }
#   }
# }

# provider "postgresql" {
#     host = aws_db_instance.postgres.address
#     port = 5432
#     username = var.db_username
#     password = var.db_password
#     database = var.db_name
#     sslmode = "disable"
#     connect_timeout = 15

#     # depends_on = [
#     #     aws_db_instance.postgres
#     # ]
# }

