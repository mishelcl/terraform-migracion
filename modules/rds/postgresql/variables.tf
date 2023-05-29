variable "identifier_db" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
}

variable "allocated_storage_db" {
  description = "The allocated storage in gibibytes."
  type        = number
}

variable "engine_db" {
  description = "The database engine to use."
  type        = string
}

variable "engine_version_db" {
  description = "The engine version to use."
  type        = string
}

variable "instance_class_db" {
  description = "(Required) The instance type of the RDS instance."
  type        = string
}

variable "publicly_accessible_db" {
  description = "(Optional) Bool to control if instance is publicly accessible. "
  type        = bool
}

variable "username_db" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Username for the master DB user"
  type        = string
  sensitive   = true
}

variable "password_db" {
  description = "Required unless manage_master_user_password is set to true or unless a snapshot_identifier or replicate_source_db is provided or manage_master_user_password is set.) Password for the master DB user"
  type        = string
  sensitive   = true
}

variable "port_db" {
  description = "(Optional) The port on which the DB accepts connections."
  type        = number
}

variable "multi_az_db" {
  description = "(Optional) Specifies if the RDS instance is multi-AZ"
  type        = bool
}

variable "storage_encrypted_db" {
  description = " (Optional) Specifies whether the DB instance is encrypted. "  
  type = bool
}

variable "skip_final_snapshot_db" {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. "
  type = bool
}

variable "vpc_security_group_ids_db" {
  description = "(Optional) List of VPC security groups to associate."
  type = list
}

variable "db_subnet_group_name_db" {
  description = "(Optional) Name of DB subnet group. "
  type = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map
}