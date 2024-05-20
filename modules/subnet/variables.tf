variable "subnet_cidr" {
  type    = string
}

variable "map_public_ip_on_launch" {
  type    = bool
}

variable "availability_zone" {
  type    = string
}

variable "vpc_id" {
  type = string
}

//variable "is_public" {
  //description = "Is this a public subnet?"
  //type        = bool
//}