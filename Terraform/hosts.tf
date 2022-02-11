# Declare EC2 instance
resource "aws_instance" "BastionHost" {
	ami           = "ami-033b95fb8079dc481"
	instance_type = "t2.micro"
  key_name = "BastionHostKeyPair"
  subnet_id     = aws_subnet.vpc_subnet_public_1.id
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.bastion_host_sg_vpc_prod.id]
  tags = {
     Name = "Bastion Host"
  }
}