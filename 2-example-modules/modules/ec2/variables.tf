# Required variables
variable "env" {}

variable "ami_id" {}
variable "count" {}
variable "subnet_id" {}

# Variables with defaults
variable "instance_type" {
  default = "t2.micro"
}

variable "product" {
  default = "demoapp"
}
