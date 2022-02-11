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
