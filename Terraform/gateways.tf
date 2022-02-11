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