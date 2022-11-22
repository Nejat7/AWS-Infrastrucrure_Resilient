variable "aws_account_id" {
    description = "aws account id"  
}

variable "aws_region" {
  description = "Region for Aws"
}

variable "user_account_role_arn" {
    description = "Arn for user account role"  
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
}

variable "subnets_cidr" {
  description = "List of cidr_blocks for public subnets"
  type        = list(any)
}

variable "azs" {
  description = "A list of availability zones"
  type        = list(any)
}

variable "instance_ami" {
  description = "Linux 2 ami for EC2 instance"
}

variable "instance_type" {}

variable "service_ports" {
  type        = list(number)
  description = "list of ingress ports"
}

variable "elb_port" {
  type        = number
  description = "ELB port number"
}

variable "server_port" {
  type        = number
  description = "instance port number for incoming http request"
}

variable "disk_space" {
  type = number
}

variable "volume_type" {}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}