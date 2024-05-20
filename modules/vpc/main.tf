resource "aws_vpc" "kido" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames


  
  tags = {
    Name = "My First VPC"
  }
}
