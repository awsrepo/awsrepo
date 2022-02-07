# Documents
# https://learn.hashicorp.com/tutorials/terraform/associate-study?in=terraform/certification

# declare provider
provider "aws" {
	region = "us-east-1"
}

# Declare EC2 instance
#resource "aws_instance" "example" {
#	ami           = "ami-40d28157"
#	instance_type = "t2.micro"
#   subnet_id     = "subnet-02b5e08e15e2b5864"
#   tags = {
#     Name = "my-first-tf-node"
#   }
#}

# Create VPC
resource "aws_vpc" "vpc_prod" {
	cidr_block				= "10.0.0.0/16"
	enable_dns_support 		= true
	enable_dns_hostnames 	= true
	tags = {
		Name = "production-vpc"
	} 
}