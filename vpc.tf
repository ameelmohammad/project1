## Vpc 
resource "aws_vpc" "network" {
  cidr_block       = var.cidr_vpc
  instance_tenancy = "default"
  enable_dns_hostnames = true 

  tags = {
    Name = "VPC-TF"
  }
}
## IGW 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.network.id

  tags = {
    Name = "IGW-TF"
  }
}
resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "PublicRT"
  }
}
resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.network.id
  cidr_block = var.cidr_sub1
  availability_zone = "us-east-1a"  

  tags = {
    Name = "Publicsubnet-1"
  }
}