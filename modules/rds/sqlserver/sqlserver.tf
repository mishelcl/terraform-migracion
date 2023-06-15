
resource "aws_db_instance" "rds-sqlserver" {
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
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  tags                   = var.tags
}