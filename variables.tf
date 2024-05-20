variable "vpc_cidr_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "Public_subnet_cidr" {
  type    = string
  default = "192.168.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "192.168.2.0/24"
}

variable "internet_gateway" {
  type    = string
  default = "0.0.0.0/0"
}


variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "availability_zone" {
  type    = string
  default = "eu-west-2a"
}

variable "availability_zone_2b" {
  type    = string
  default = "eu-west-2b"
}

variable "nat_gateway" {
  type    = string
  default = "0.0.0.0/0"
}

variable "key_name" {
  type    = string
  default = "public-key"
}

variable "private_key_filename" {
  type    = string
  default = "tfkey"
}

variable "public_key_filename" {
  type    = string
  default = "public-key.pem"
}

variable "igw_name" {
  type    = string
  default = "My-First-IGW"
}

variable "nat_gateway_name" {
  type    = string
  default = "My-First-Nat-Gateway"
}

variable "domain" {
  type    = bool
  default = true
}

variable "amzn_linux_ami_id" {
  type    = string
  default = "ami-008ea0202116dbc56"
}

variable "instance_name" {
  type    = string
  default = "My-First-Public-Instance"
}

variable "map_public_ip_on_launch_1" {
  type    = bool
  default = true
}

variable "map_public_ip_on_launch_2" {
  type    = bool
  default = false
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "shared_credentials_files" {
  type        = list(string)
  description = "The list of shared credentials files."
  default     = ["~/.aws/credentials"]
}

variable "bucket_name" {
  type    = string
  default = "kido3buc1235"
}

variable "name" {
  type    = string
  default = "My bucket"
}