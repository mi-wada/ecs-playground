resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "ecsp-vpc"
  }
}

locals {
  public_subnets = {
    "ap-northeast-1a" = {
      cidr_block = "10.0.0.0/20"
      az         = "ap-northeast-1a"
    }
    "ap-northeast-1c" = {
      cidr_block = "10.0.16.0/20"
      az         = "ap-northeast-1c"
    }
  }
  private_subnets = {
    "ap-northeast-1a" = {
      cidr_block = "10.0.128.0/20"
      az         = "ap-northeast-1a"
    }
    "ap-northeast-1c" = {
      cidr_block = "10.0.144.0/20"
      az         = "ap-northeast-1c"
    }
  }
}

resource "aws_subnet" "public" {
  for_each = local.public_subnets

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = false
  availability_zone       = each.value.az
  tags = {
    Name = "public-${each.key}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "public" {
  for_each = local.public_subnets

  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public[each.key].id
}

resource "aws_subnet" "private" {
  for_each = local.private_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az
  tags = {
    Name = "private-${each.key}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "private"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.ap-northeast-1.s3"

  route_table_ids = [
    aws_route_table.private.id
  ]
  tags = {
    Name = "s3"
  }
}

resource "aws_security_group" "interface_vpc_endpoint" {
  vpc_id      = aws_vpc.main.id
  name        = "interface-vpce"
  description = "For Interface type VPC Endpoint"
}

resource "aws_vpc_security_group_ingress_rule" "interface_vpc_endpoint_allow_private" {
  security_group_id = aws_security_group.interface_vpc_endpoint.id
  cidr_ipv4         = "10.0.0.0/16"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.ap-northeast-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.interface_vpc_endpoint.id
  ]
  subnet_ids = [for s in aws_subnet.private : s.id]
  tags = {
    Name = "ecr_dkr"
  }
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.ap-northeast-1.ecr.api"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.interface_vpc_endpoint.id
  ]
  subnet_ids = [for s in aws_subnet.private : s.id]
  tags = {
    Name = "ecr_api"
  }
}

resource "aws_vpc_endpoint" "logs" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.ap-northeast-1.logs"
  vpc_endpoint_type = "Interface"
  security_group_ids = [
    aws_security_group.interface_vpc_endpoint.id
  ]
  subnet_ids = [for s in aws_subnet.private : s.id]
  tags = {
    Name = "logs"
  }
}

resource "aws_route_table_association" "private" {
  for_each = local.private_subnets

  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private[each.key].id
}
