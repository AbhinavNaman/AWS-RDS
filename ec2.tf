resource "aws_instance" "bastion" {
      ami                    = "ami-0261755bbcb8c4a84"
  instance_type          = "t2.micro"
  subnet_id = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  associate_public_ip_address = true
  key_name = 
}