variable "ami" {
  description = "(Optional) AMI to use for the instance."
  type        = string
}

variable "instance_type" {
  description = "(Optional) Instance type to use for the instance. "
  type        = string
}

variable "vpc_security_group_ids" {
  description = "(Optional, VPC only) List of associated security groups in a non-default VPC."
  type        = list(any)
}

variable "subnet_id" {
  description = "(Optional) VPC Subnet ID to launch in."
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

variable "tags" {
  description = "(Optional) Map of tags to assign to the resource. "
  type        = map(any)
}