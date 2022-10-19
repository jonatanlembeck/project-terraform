resource "aws_vpc" "My-VPC-TF" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instance_Tenancy
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostName
 
  tags = {
    Name = "My-VPC-tf"
  }
}
resource "aws_subnet" "PUBLIC_subnet" {
  vpc_id                  = aws_vpc.My-VPC-TF.id
  cidr_block              = var.publicsCIDRblock
  map_public_ip_on_launch = var.mapPublicIP
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }


}
resource "aws_network_acl" "Public_acl" {
  #Name      = "My Network-ACL"
  vpc_id     = aws_vpc.My-VPC-TF.id
 


  ingress {
    protocol  = "tcp"
    action    = "allow"
    rule_no   = 100
    from_port = 22
    to_port   = 22
    cidr_block = "10.0.0.0/16"
  }
  egress {
    action    = "allow"
    protocol  = "tcp"
    rule_no   = 100
    from_port = 22
    cidr_block = "0.0.0.0/0"
    to_port   = 22
  }
  tags = {
    Name = "Public subnet"
  }

}
resource "aws_internet_gateway" "My-IGW" {
  vpc_id = aws_vpc.My-VPC-TF.id

  tags = {
    Name = "My internet gateway"
  }

}
resource "aws_route_table" "My-public_RT" {
  vpc_id = aws_vpc.My-VPC-TF.id
  tags = {
    name = "Public Route Table"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.My-public_RT.id
  destination_cidr_block = var.publicdestCIDRblock
  gateway_id             = aws_internet_gateway.My-IGW.id
}
resource "aws_route_table_association" "Public_association" {
  subnet_id      = aws_subnet.PUBLIC_subnet.id
  route_table_id = aws_route_table.My-public_RT.id
}
