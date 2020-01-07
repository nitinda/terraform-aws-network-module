# DHCP Option #####################################
variable "domain_name_servers" {
  description = "List of name servers to configure in /etc/resolv.conf."
  type        = list(string)
}

variable "domain_name" {
  description = "The suffix domain name to use by default when resolving non Fully Qualified Domain Names."
}

# VPC ########################################
variable "cidr_block" {
  description = "The CIDR block for the VPC."
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false"
}

# Subnet #####################################
variable "public_subnets_cidr" {
  description = "The CIDR block for the subnet."
  type        = list(string)
}

variable "private_subnets_cidr" {
  description = "The CIDR block for the subnet."
  type        = list(string)
}

variable "db_subnets_cidr" {
  description = "The CIDR block for the subnet."
  type        = list(string)
  default     = []
}

variable "availability_zones" {
  description = "The AZ for the subnet."
  type        = list(string)
}

# Tags ###################################
variable "common_tags" {
  description = "Resources Tags"
  type        = map(string)
}

variable "tag_name_prefix" {
  description = "Resources Name Tag prefix"
}

