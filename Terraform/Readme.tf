# Documents
# https://learn.hashicorp.com/tutorials/terraform/associate-study?in=terraform/certification

# declare provider
provider "aws" {
	region = "us-east-1"
}

# Create VPC
resource "aws_vpc" "vpc_prod" {
	cidr_block				= "10.50.0.0/16"
	enable_dns_support 		= true
	enable_dns_hostnames 	= true
	tags = {
		Name = "Production_VPC"
	} 
}

# Internet Gateway

resource "aws_internet_gateway" "igw_vpc_prod" {
  vpc_id = aws_vpc.vpc_prod.id

  tags = {
    Name = "IGW_vpc_prod"
  }
}

# EIP Nat Gateway

resource "aws_eip" "eip_ngw_vpc_prod" {
  vpc = true

  tags = {
    Name = "VPC Prod Elastic IP Nat Gateway"
  }
}

# NAT Gateway

resource "aws_nat_gateway" "ngw_vpc_prod" {
  allocation_id = aws_eip.eip_ngw_vpc_prod.id
  subnet_id     = aws_subnet.vpc_subnet_public_2.id

  tags = {
    Name = "NGW_vpc_prod"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw_vpc_prod]
}

# Create Subnets
# Private

resource "aws_subnet" "vpc_subnet_private_1" {
  vpc_id     = aws_vpc.vpc_prod.id
  cidr_block = "10.50.0.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Prod_Subnet_Priv1"
  }
}

resource "aws_subnet" "vpc_subnet_private_2" {
  vpc_id     = aws_vpc.vpc_prod.id
  cidr_block = "10.50.16.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Prod_Subnet_Priv2"
  }
}

resource "aws_subnet" "vpc_subnet_private_3" {
  vpc_id     = aws_vpc.vpc_prod.id
  cidr_block = "10.50.32.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Prod_Subnet_Priv3"
  }
}

# Public

resource "aws_subnet" "vpc_subnet_public_1" {
  vpc_id     = aws_vpc.vpc_prod.id
  cidr_block = "10.50.48.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Prod_Subnet_Pub1"
  }
}

resource "aws_subnet" "vpc_subnet_public_2" {
  vpc_id     = aws_vpc.vpc_prod.id
  cidr_block = "10.50.64.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Prod_Subnet_Pub2"
  }
}

resource "aws_subnet" "vpc_subnet_public_3" {
  vpc_id     = aws_vpc.vpc_prod.id
  cidr_block = "10.50.80.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Prod_Subnet_Pub3"
  }
}

# Route tables

# Main route table
resource "aws_default_route_table" "RT_default_prod" {
  default_route_table_id = aws_vpc.vpc_prod.default_route_table_id

  tags = {
    Name = "RT_default_prod"
  }
}

# Custom route table
# Private 1
resource "aws_route_table" "rt_sbt_private_1" {
  vpc_id = aws_vpc.vpc_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw_vpc_prod.id
  }

  tags = {
    Name = "RT_sbt_private_1"
  }
}

resource "aws_route_table_association" "ass_rt_priv_1" {
  subnet_id      = aws_subnet.vpc_subnet_private_1.id
  route_table_id = aws_route_table.rt_sbt_private_1.id
}

# Private 2
resource "aws_route_table" "rt_sbt_private_2" {
  vpc_id = aws_vpc.vpc_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw_vpc_prod.id
  }

  tags = {
    Name = "RT_sbt_private_2"
  }
}

resource "aws_route_table_association" "ass_rt_priv_2" {
  subnet_id      = aws_subnet.vpc_subnet_private_2.id
  route_table_id = aws_route_table.rt_sbt_private_2.id
}

# Private 3
resource "aws_route_table" "rt_sbt_private_3" {
  vpc_id = aws_vpc.vpc_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw_vpc_prod.id
  }

  tags = {
    Name = "RT_sbt_private_3"
  }
}

resource "aws_route_table_association" "ass_rt_priv_3" {
  subnet_id      = aws_subnet.vpc_subnet_private_3.id
  route_table_id = aws_route_table.rt_sbt_private_3.id
}

# Public 1
resource "aws_route_table" "rt_sbt_public_1" {
  vpc_id = aws_vpc.vpc_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc_prod.id
  }

  tags = {
    Name = "RT_sbt_public_1"
  }
}

resource "aws_route_table_association" "ass_rt_pub_1" {
  subnet_id      = aws_subnet.vpc_subnet_public_1.id
  route_table_id = aws_route_table.rt_sbt_public_1.id
}

# Public 2
resource "aws_route_table" "rt_sbt_public_2" {
  vpc_id = aws_vpc.vpc_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc_prod.id
  }

  tags = {
    Name = "RT_sbt_public_2"
  }
}

resource "aws_route_table_association" "ass_rt_pub_2" {
  subnet_id      = aws_subnet.vpc_subnet_public_2.id
  route_table_id = aws_route_table.rt_sbt_public_2.id
}

# Public 3
resource "aws_route_table" "rt_sbt_public_3" {
  vpc_id = aws_vpc.vpc_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc_prod.id
  }

  tags = {
    Name = "RT_sbt_public_3"
  }
}

resource "aws_route_table_association" "ass_rt_pub_3" {
  subnet_id      = aws_subnet.vpc_subnet_public_3.id
  route_table_id = aws_route_table.rt_sbt_public_3.id
}

# DHCP set options

resource "aws_default_vpc_dhcp_options" "dhcp_default_vpc_prod" {
  tags = {
    Name = "Default DHCP Option Set VPC Prod"
  }
}

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

# Network ACLs

resource "aws_default_network_acl" "default_nacl_vpc_prod" {
  default_network_acl_id = aws_vpc.vpc_prod.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "Default Network ACL VPC Prod"
  }
}

# Declare EC2 instance
resource "aws_instance" "example" {
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
