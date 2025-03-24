variable "OPENSSH_PRIVATE_KEY" {
  description = "this is used for SSH-ing to the ec2 instance"
  type        = string
  sensitive   = true
}

variable "ssh_private_key_path" {
  description = "value"
  type        = string
}

variable "OPENSSH_PUBLIC_KEY" {
  description = "this is used for SSH-ing to the ec2 instance"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access the rds instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "db_identifier" {
  description = " unique name of the DB instance"
  type        = string
  default     = "postgresdb"
}

variable "db_name" {
  description = "name of the DB"
  type        = string
  default     = "postgresdb"
}

variable "db_username" {
  description = "admin user"
  type        = string
  default     = "postgresdb"
}

variable "db_password" {
  description = "admin password"
  type        = string
  default     = "postgresdb"
  sensitive   = true
}

variable "engine_version" {
  description = "postgres version"
  type        = string
  default     = "13.3"
}

variable "instance_class" {
  description = "db.t3.micro"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "allocated storage"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "max allocated storage"
  type        = number
  default     = 50
}


variable "AWS_ACCESS_KEY" {
  description = "value of the access key"
  type        = string
  sensitive   = true
}

variable "AWS_SECRET_KEY" {
  description = "value of the secret key"
  type        = string
  sensitive   = true
}