

resource "aws_vpc" "main" {
  cidr_block           = var.cidr-range-vpc
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}
