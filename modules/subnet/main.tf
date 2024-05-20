resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "My-First-Subnet"
    //"kubernetes.io/role/internal-elb" = var.is_public ? "0" : "1" #this instruct the kubernetes to create public load balancer in these subnets
    //"kubernetes.io/cluster/demo"      = "owned"
  }
}
