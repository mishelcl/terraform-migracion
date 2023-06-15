variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gibibytes."
  type        = number
}

variable "engine" {
  description = "The database engine to use."
  type        = string
}

variable "engine_version" {
  description = "The engine version to use."
  type        = string
}

variable "instance_class" {
  description = "(Required) The instance type of the RDS instance."
  type        = string
}

variable "license_model" {
  description = " (Optional, but required for some DB engines, i.e., Oracle SE1) License model information for this DB instance."
  type        = string
}

variable "publicly_accessible" {
  description = "(Optional) Bool to control if instance is publicly accessible. "
  type        = bool
}

variable "username" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Username for the master DB user"
  type        = string
  sensitive   = true
}

variable "password" {
  description = "Required unless manage_master_user_password is set to true or unless a snapshot_identifier or replicate_source_db is provided or manage_master_user_password is set.) Password for the master DB user"
  type        = string
  sensitive   = true
}

variable "port" {
  description = "(Optional) The port on which the DB accepts connections."
  type        = number
}

variable "timezone" {
  description = "(Optional) Time zone of the DB instance. "
  type        = string
}

variable "multi_az" {
  description = "(Optional) Specifies if the RDS instance is multi-AZ"
  type        = bool
}

variable "storage_encrypted" {
  description = " (Optional) Specifies whether the DB instance is encrypted. "
  type        = bool
}

variable "skip_final_snapshot" {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. "
  type        = bool
}

variable "vpc_security_group_ids" {
  description = "(Optional) List of VPC security groups to associate."
  type        = list(any)
}

variable "db_subnet_group_name" {
  description = "(Optional) Name of DB subnet group. "
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(any)
}