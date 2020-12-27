variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "amis" {
    type = "map"
    description = "AMIs by region"
    default = {
    us-east-1 = "ami-032930428bf1abbff" # Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type
		us-east-2 = "ami-027cab9a7bf0155df" # Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type
    }
}
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable Main_Routing_Table {}
variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public-cidrs" {
  description = "CIDRs for Public subnets"
  type = "list"
  default = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "private-cidrs" {
  description = "CIDRs for Private subnets"
  type = "list"
  default = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24","10.1.40.0/24","10.1.50.0/24","10.1.60.0/24"]
}

variable "environment" {}
variable "instance_type" {}



