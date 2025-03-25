resource "aws_instance" "bastion" {
  ami                         = "ami-0261755bbcb8c4a84"
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnets.default.ids[0]
  vpc_security_group_ids      = [data.aws_security_group.rds-sg.id]
  associate_public_ip_address = true
  key_name                    = data.aws_key_pair.example.key_name

  tags = {
    Name = "psql-bastion-host"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y postgresql-client",
      <<EOT
    PGPASSWORD='postgresdb' psql -h ${aws_db_instance.postgres.address} -U postgresdb -d postgresdb -c "CREATE TABLE IF NOT EXISTS terraformMetrics (
    id TEXT PRIMARY KEY,
    success BOOLEAN NOT NULL,
    timestamp TIMESTAMPTZ DEFAULT NOW(),
    applied_resources TEXT[],
    failed_resources TEXT[],
    created_resources TEXT[],
    updated_resources TEXT[],
    deleted_resources TEXT[],
    total_time INTEGER NOT NULL,
    error_messages TEXT[]
    );"
    EOT
    ]


    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.ssh_private_key_path)
      host        = self.public_ip
    }
  }
}

