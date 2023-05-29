resource "aws_db_instance" "rds-posgres" {
  identifier                    = var.identifier_db
  allocated_storage             = var.allocated_storage_db
  engine                        = var.engine_db
  engine_version                = var.engine_version_db
  instance_class                = var.instance_class_db
  publicly_accessible           = var.publicly_accessible_db
  username                      = var.username_db
  password                      = var.password_db
  port                          = var.port_db
  multi_az                      = var.multi_az_db
  storage_encrypted             = var.storage_encrypted_db
  skip_final_snapshot           = var.skip_final_snapshot_db
  vpc_security_group_ids        = var.vpc_security_group_ids_db
  db_subnet_group_name          = var.db_subnet_group_name_db
  tags                          = var.tags
}