# Create the VPC with DNS support and custom tag
resource "aws_vpc" "this" {
  cidr_block           = var.network.vpc_cidr
  enable_dns_support   = var.network.enable_dns_support
  enable_dns_hostnames = var.network.enable_dns_hostnames
  tags                 = { Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-vpc" }
}

# Create public subnets in specified availability zones
resource "aws_subnet" "public" {
  count             = length(var.network.public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.network.public_subnets[count.index]
  availability_zone = var.network.availability_zones[count.index]
  tags              = { Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-pub-subnet" }
}

# Create private subnets in specified availability zones
resource "aws_subnet" "private" {
  count             = length(var.network.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.network.private_subnets[count.index]
  availability_zone = var.network.availability_zones[count.index]
  tags              = { Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-priv-subnet" }
}

# Attach an Internet Gateway to the VPC for public internet access
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = { Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-igw" }
}

# Allocate Elastic IPs for NAT Gateways
resource "aws_eip" "nat" {
  count  = length(var.network.public_subnets)
  domain = var.network.eip_domain
  tags   = { Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-nat-ip" }
}

# Create NAT Gateways in public subnets to allow private subnets to access the internet
resource "aws_nat_gateway" "this" {
  count         = length(var.network.public_subnets)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags          = { Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-gtw-nat" }
}

# Create route tables for private subnets with route to NAT Gateway
resource "aws_route_table" "private" {
  count  = length(var.network.private_subnets)
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = var.network.default_route_cidr_block
    nat_gateway_id = aws_nat_gateway.this[count.index].id
  }

  tags = {
    Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-priv-route"
  }
}

# Associate private subnets with their corresponding private route tables
resource "aws_route_table_association" "private" {
  count          = length(var.network.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

# Create a public route table with a default route to the Internet Gateway
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.network.default_route_cidr_block
    gateway_id = aws_internet_gateway.this.id
  }

  tags = { Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-pub-route" }
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public" {
  count          = length(var.network.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}