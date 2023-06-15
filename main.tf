
# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc_module" {
  source                      = "./modules/vpc"
  cidr_block_vpc              = var.cidr_block_vpc
  cidr_block_public_subnet    = var.cidr_block_public_subnet
  cidr_block_private_subnet_1 = var.cidr_block_private_subnet_1
  cidr_block_private_subnet_2 = var.cidr_block_private_subnet_2
  availability_zone_1         = var.availability_zone_1
  availability_zone_2         = var.availability_zone_2
  db_subnet_group_name        = var.db_subnet_group_name
  sg_bastion_name             = var.sg_bastion_name
  bastion_ingress_rules       = var.bastion_ingress_rules
  bastion_egress_rules        = var.bastion_egress_rules
  sg_sqlserver_name           = var.sg_sqlserver_name
  sqlserver_ingress_rules     = var.sqlserver_ingress_rules
  sqlserver_egress_rules      = var.sqlserver_egress_rules
  sg_postgre_name             = var.sg_postgre_name
  postgre_ingress_rules       = var.postgre_ingress_rules
  postgre_egress_rules        = var.postgre_egress_rules
  route_cidr_block            = var.route_cidr_block
  tags                        = var.tags
}

module "ec2_module" {
  source                      = "./modules/ec2"
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [module.vpc_module.bastion_security_group_id]
  subnet_id                   = module.vpc_module.public_subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  tags                        = var.tags_ec2
}

module "rds_module" {
  source                 = "./modules/rds/sqlserver"
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  license_model          = var.license_model
  publicly_accessible    = var.publicly_accessible
  username               = var.username
  password               = var.password
  port                   = var.port
  timezone               = var.timezone
  multi_az               = var.multi_az
  storage_encrypted      = var.storage_encrypted
  skip_final_snapshot    = var.skip_final_snapshot
  vpc_security_group_ids = [module.vpc_module.sqlserver_security_group_id]
  db_subnet_group_name   = module.vpc_module.db_subnet_group_name
  tags                   = var.tags
}


module "rds_postgre_module" {
  source                    = "./modules/rds/postgresql"
  identifier_db             = var.identifier_db
  allocated_storage_db      = var.allocated_storage_db
  engine_db                 = var.engine_db
  engine_version_db         = var.engine_version_db
  instance_class_db         = var.instance_class_db
  publicly_accessible_db    = var.publicly_accessible_db
  username_db               = var.username_db
  password_db               = var.password_db
  port_db                   = var.port_db
  multi_az_db               = var.multi_az_db
  storage_encrypted_db      = var.storage_encrypted_db
  skip_final_snapshot_db    = var.skip_final_snapshot_db
  vpc_security_group_ids_db = [module.vpc_module.postgre_security_group_id]
  db_subnet_group_name_db   = module.vpc_module.db_subnet_group_name
  tags                      = var.tags
}
