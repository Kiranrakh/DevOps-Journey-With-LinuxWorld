variable "region" {
  default = "ap-south-1"
}

variable "cidr-range-vpc" {
  default = "10.0.0.0/16"
}

output "vpc-id-output" {
  value = aws_vpc.main.id
}
