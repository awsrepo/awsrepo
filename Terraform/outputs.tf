# Outputs
output "BastionHost_public_ip" {
  description = "Bastion Host Public IP"
  value = aws_instance.BastionHost.public_ip
}

output "VPC_id" {
  description = "VPC Id"
  value = aws_vpc.vpc_prod.id
}