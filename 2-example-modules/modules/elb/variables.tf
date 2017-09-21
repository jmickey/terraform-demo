# Required variables
variable "env" {}

variable "instance_port" {}
variable "instance_protocol" {}
variable "lb_port" {}
variable "lb_protocol" {}

variable "instances" {
  type = "list"
}

# Variables with defaults
variable "availablity_zones" {
  default = "ap-southeast-2a,ap-southeast-2b,ap-southeast-2c"
}

variable "product" {
  default = "demoapp"
}
