resource "aws_vpc" "vpc-migration" {
  cidr_block = var.cidr_block_vpc
  tags       = var.tags
}

//Subnets
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.vpc-migration.id
  cidr_block        = var.cidr_block_public_subnet
  availability_zone = var.availability_zone_1
  tags              = var.tags
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.vpc-migration.id
  cidr_block        = var.cidr_block_private_subnet_1
  availability_zone = var.availability_zone_1
  tags              = var.tags
}

resource "aws_subnet" "private-subnet-2" {
   vpc_id            = aws_vpc.vpc-migration.id
  cidr_block        = var.cidr_block_private_subnet_2
  availability_zone = var.availability_zone_2
  tags              = var.tags
}

resource "aws_db_subnet_group" "db-subnet-group" {
  name       = var.db_subnet_group_name
  subnet_ids = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id ]
  tags       = var.tags
}

//Security Groups
resource "aws_security_group" "sg-bastion" {
    name    = var.sg_bastion_name
    vpc_id  = aws_vpc.vpc-migration.id
    
    dynamic "ingress" {
        for_each = var.bastion_ingress_rules
        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }
    dynamic "egress" {
        for_each = var.bastion_egress_rules
        content {
            from_port = egress.value["from_port"]
            to_port = egress.value["to_port"]
            protocol = egress.value["protocol"]
            cidr_blocks = egress.value["cidr_blocks"]
        }
    }
    tags = var.tags
}

resource "aws_security_group" "sg-sqlserver" {
    name    = var.sg_sqlserver_name
    vpc_id  = aws_vpc.vpc-migration.id
    
    dynamic "ingress" {
        for_each = var.sqlserver_ingress_rules
        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }
    dynamic "egress" {
        for_each = var.sqlserver_egress_rules
        content {
            from_port = egress.value["from_port"]
            to_port = egress.value["to_port"]
            protocol = egress.value["protocol"]
            cidr_blocks = egress.value["cidr_blocks"]
        }
    }
    tags = var.tags
}

resource "aws_security_group" "sg-postgre" {
    name    = var.sg_postgre_name
    vpc_id  = aws_vpc.vpc-migration.id
    
    dynamic "ingress" {
        for_each = var.postgre_ingress_rules
        content {
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }
    dynamic "egress" {
        for_each = var.postgre_egress_rules
        content {
            from_port = egress.value["from_port"]
            to_port = egress.value["to_port"]
            protocol = egress.value["protocol"]
            cidr_blocks = egress.value["cidr_blocks"]
        }
    }
    tags = var.tags
}

// Connect to Internet
resource "aws_internet_gateway" "igw-demo" {
  vpc_id = aws_vpc.vpc-migration.id
  tags = var.tags
}

resource "aws_route_table" "rt-demo" {
  vpc_id = aws_vpc.vpc-migration.id

  route {
    cidr_block = var.route_cidr_block
    gateway_id = aws_internet_gateway.igw-demo.id
  }

  tags = var.tags
}

resource "aws_main_route_table_association" "rta-demo" {
  vpc_id         = aws_vpc.vpc-migration.id
  route_table_id = aws_route_table.rt-demo.id
}