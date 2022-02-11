# Create VPC
resource "aws_vpc" "vpc_prod" {
	cidr_block				    = "10.50.0.0/16"
	enable_dns_support 		= true
	enable_dns_hostnames 	= true
	tags = {
		Name = "${var.env}_vpc"
	} 
}

# DHCP set options

resource "aws_default_vpc_dhcp_options" "dhcp_default_vpc_prod" {
  tags = {
    Name = "Default DHCP Option Set VPC Prod"
  }
}
