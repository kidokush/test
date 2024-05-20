module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

module "public_subnet" {
  source                  = "./modules/subnet"
  availability_zone       = var.availability_zone
  vpc_id                  = module.vpc.vpc_id
  map_public_ip_on_launch = var.map_public_ip_on_launch_1
  subnet_cidr             = var.Public_subnet_cidr
  //is_public               = true
}

module "private_subnet" {
  source                  = "./modules/subnet"
  availability_zone       = var.availability_zone_2b
  vpc_id                  = module.vpc.vpc_id
  map_public_ip_on_launch = var.map_public_ip_on_launch_2
  subnet_cidr             = var.private_subnet_cidr
  //is_public               = false
}

module "Public_route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
}

module "private_route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
}

module "capstone_frontend_main" {
  source          = "./modules/ecr"
  repository_name = "capstone-frontend-main"
}

module "capstone_backend_main" {
  source          = "./modules/ecr"
  repository_name = "capstone-backend-main"
}

module "keypair" {
  source               = "./modules/keypair"
  key_name             = var.key_name
  public_key_filename  = var.public_key_filename
  private_key_filename = var.private_key_filename
}

module "internet_gateway" {
  source                 = "./modules/internet_gateway"
  vpc_id                 = module.vpc.vpc_id
  igw_name               = var.igw_name
  route_table_id         = module.Public_route_table.route_table_id
  destination_cidr_block = var.internet_gateway
}

module "route_table_association" {
  source                 = "./modules/route_table_association"
  private_subnet_id      = module.private_subnet.subnet_id
  private_route_table_id = module.private_route_table.route_table_id
  public_subnet_id       = module.public_subnet.subnet_id
  public_route_table_id  = module.Public_route_table.route_table_id
}

module "nat_gateway" {
  source                 = "./modules/nat_gateway"
  public_subnet_id       = module.public_subnet.subnet_id
  internet_gateway_id    = module.internet_gateway.igw_id
  private_route_table_id = module.private_route_table.route_table_id
  nat_gateway_cidr_block = var.nat_gateway
}

# Create a new EIP for the instance
resource "aws_eip" "eip" {
  vpc = var.domain
}

# Attach the EIP to the instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2_instance.instance_id
  allocation_id = aws_eip.eip.id
}
module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2_instance" {
  source = "./modules/ec2"
  amzn_linux_ami_id           = var.amzn_linux_ami_id
  instance_type               = var.instance_type
  subnet_id                   = module.public_subnet.subnet_id
  security_group_ids          = [module.security_group.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  instance_name               = var.instance_name
}

module "aws_provider" {
  source                   = "./modules/aws_provider"
  region                   = var.region
  profile                  = var.profile
  shared_credentials_files = var.shared_credentials_files
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
  name        = var.name
}

/*terraform {
  backend "s3" {
    bucket = "kido3buc1235"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}*/
