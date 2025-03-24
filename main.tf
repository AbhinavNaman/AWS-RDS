resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = data.aws_subnets.default.ids

  tags = {
    Name = "RDS subnet group"
  }
}

# resource "aws_security_group" "rds_sg" {
#   name        = "rds-sg"
#   description = "Allow RDS access"
#   vpc_id      = data.aws_vpc.default.id

#   ingress {
#     from_port   = 5432
#     to_port     = 5432
#     protocol    = "tcp"
#     cidr_blocks = var.allowed_cidr_blocks
#   }

#   # allow all outbound traffic
#   egress {
#     from_port   = 0             # all ports
#     to_port     = 0             # all ports
#     protocol    = "-1"          # all protocols 
#     cidr_blocks = ["0.0.0.0/0"] # all IP addresses
#   }

#   tags = {
#     Name = "RDS security group"
#   }
# }



//AWS RDS postgres DB instance
resource "aws_db_instance" "postgres" {
  identifier            = var.db_identifier
  engine                = "postgres"
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = "gp2"
  storage_encrypted     = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 5432

  vpc_security_group_ids = [data.aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  multi_az            = false
  publicly_accessible = true

  tags = {
    Name = "Postgres RDS instance"
  }
}

#aws_db_subnet_group


# #table schema 
# resource "postgresql_schema" "terraformMetrics_schema" {
#   name = "terraformMetrics_schema"
#   database = var.db_name
# }

# resource "postgresql_table" "terraformMetrics" {
#   name = "terraformMetrics"
#   schema = postgresql_schema.terraformMetrics_schema.name
#   database = var.db_name
#   owner = var.db_username


#   column {
#     name = "id"
#     type = "text"
#     null = false
#   }

#   column {
#     name = "success"
#     type = "boolean"
#     null = false
#   }

#     column {
#     name = "timestamp"
#     type = "timestamptz"
#     null = true
#     default = "now()"
#   }

#     column {
#     name = "applied_resources"
#     type = "text[]"
#   }

#     column {
#     name = "failed_resources"
#     type = "text[]"
#   }

#     column {
#     name = "created_resources"
#     type = "text[]"
#   }

#     column {
#     name = "updated_resources"
#     type = "text[]"
#   }

#     column {
#     name = "deleted_resources"
#     type = "text[]"
#   }

#   column {
#     name = "total_time"
#     type = "integer"
#     null = false
#   }

#   column {
#     name = "error_messages"
#     type = "text[]"
#   }

#   primary_key {
#     name = "terraformMetrics_pkey"
#     column = ["id"]
#   }
# }


# to trigger actions
# 2