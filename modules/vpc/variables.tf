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

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(any)
}