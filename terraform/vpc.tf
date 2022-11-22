# VPC with 2 subnets

resource "aws_vpc" "Mikias_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "MikiasVPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "Mikias_igw" {
  vpc_id = aws_vpc.Mikias_vpc.id
  tags = {
    "Name" = "main igw"
  }
}

# Public subnets
resource "aws_subnet" "public_subnet" {
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.Mikias_vpc.id
  cidr_block              = element(var.subnets_cidr, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Subnet-${count.index + 1}"
  }
}

#Attaching internet gate way to Route table
resource "aws_route_table" "pub_routetab" {
  vpc_id = aws_vpc.Mikias_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Mikias_igw.id
  }
  tags = {
    "Name" = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.pub_routetab.id
}