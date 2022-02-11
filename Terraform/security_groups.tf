# Security Group

resource "aws_default_security_group" "default_sg_vpc_prod" {
  vpc_id = aws_vpc.vpc_prod.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Default Security Group VPC Prod"
  }
}

resource "aws_security_group" "bastion_host_sg_vpc_prod" {
  vpc_id = aws_vpc.vpc_prod.id
  
  name        = "Bastion Host SG"
  description = "Bastion Host Security Group VPC Prod"

  ingress {
    protocol  = "TCP"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion Host Security Group VPC Prod"
  }
}