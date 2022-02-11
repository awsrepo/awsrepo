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