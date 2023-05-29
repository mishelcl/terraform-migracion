## Provider variable
variable "region" {
  description = "(Optional) AWS region where the provider will operate. "
  type        = string
}

## VPC Variables
variable "cidr_block_vpc" {
  description = "The IPv4 CIDR block for the VPC."
  type        = string
}

variable "cidr_block_public_subnet" {
  description = "(Optional) The IPv4 CIDR block for the public subnet."
  type        = string
}

variable "cidr_block_private_subnet_1" {
  description = "(Optional) The IPv4 CIDR block for the public subnet."
  type        = string
}

variable "cidr_block_private_subnet_2" {
  description = "(Optional) The IPv4 CIDR block for the public subnet."
  type        = string
}

variable "availability_zone_1" {
  description = " (Optional) AZ for the subnet."
  type        = string
}

variable "availability_zone_2" {
  description = " (Optional) AZ for the subnet."
  type        = string
}

variable "db_subnet_group_name" {
  description = "(Optional, Forces new resource) The name of the DB subnet group. "
  type        = string
}

// Bastion
variable "sg_bastion_name" {
  description = " (Optional) Name of the security group for bastion instance."
  type        = string
}

variable "bastion_ingress_rules" {
  description = "(Optional) A map of ingress rules for bastion instance."
  type        = list(any)
}

variable "bastion_egress_rules" {
  description = "(Optional) A map of egress rules for bastion instance."
  type        = list(any)
}

//SQL Server
variable "sg_sqlserver_name" {
  description = " (Optional) Name of the security group for RDS Sql Server instance."
  type        = string
}

variable "sqlserver_ingress_rules" {
  description = "(Optional) A map of ingress rules for RDS Sql Server instance."
  type        = list(any)
}

variable "sqlserver_egress_rules" {
  description = "(Optional) A map of egress rules for RDS Sql Server instance."
  type        = list(any)
}

//PostgreSQL
variable "sg_postgre_name" {
  description = " (Optional) Name of the security group for RDS PostgreSQL instance."
  type        = string
}

variable "postgre_ingress_rules" {
  description = "(Optional) A map of ingress rules for RDS PostgreSQL instance."
  type        = list(any)
}

variable "postgre_egress_rules" {
  description = "(Optional) A map of egress rules for RDS PostgreSQL instance."
  type        = list(any)
}

//Internet Gateway
variable "route_cidr_block" {
  description = " The CIDR block of the route."
  type        = string
}

## Bastion Variables
variable "ami" {
  description = "(Optional) AMI to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "(Optional) Instance type to use for the instance. "
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether or not the Instance is associated with a public IP address or not (Boolean)."
  type        = bool
}

variable "key_name" {
  description = "(Optional) Key name of the Key Pair to use for the instance."
  type        = string
}

variable "tags_ec2" {
  description = "(Optional) A map of tags to assign to the ec2 resource."
  type        = map
}

## RDS SQL Server Variables 
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
  type = bool
}

variable "skip_final_snapshot" {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. "
  type = bool
}

## RDS postgre SQL DB
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

// Common tags
variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map
}