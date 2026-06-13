# Retrieve avalibilty zones in the target region
data "aws_availability_zones" "available" {
  state = "available"
}

# Retrieve avalibilty zones in the target region
data "aws_region" "current" {}

# Retrieve information about the user and account used for TF
data "aws_caller_identity" "current" {}

# Static configuration with hardcoded values
resource "aws_vpc" "production" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.enviornment}-vpc"
    Environment = var.enviornment
    Project     = var.project_name
    ManagedBy   = "manual-deployment"
    Region      = data.aws_region.current.region
    AccountID   = data.aws_caller_identity.current.account_id
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.production.id
  cidr_block              = var.subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.enviornment}-private-subnet"
    Environment = var.enviornment
    Project     = var.project_name
    ManagedBy   = "terraform"
    Region      = data.aws_region.current.region
    AZ          = data.aws_availability_zones.available.names[0]
  }
}

resource "aws_route_table" "static" {
  vpc_id = aws_vpc.production.id

  tags = {
    Name        = "${var.enviornment}-route-table"
    Environment = var.enviornment
    Project     = var.project_name
    ManagedBy   = "terraform"
    Region      = data.aws_availability_zones.available.names[0]
  }
}