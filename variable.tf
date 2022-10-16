variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnet_cidr1" {
  default = "10.0.0.0/24"

}

variable "tags" {
  default = "ssm_test"
}