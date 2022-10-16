# VPCの作成
resource "aws_vpc" "ssm_test" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.tags
  }

}

# VPC作成時に自動的に作成されるデフォルトSGのルールを編集することができる
# 参考URL：https://urotasm.hatenablog.com/entry/2021/12/29/210243
resource "aws_default_security_group" "ssm_test" {
  vpc_id = aws_vpc.ssm_test.id
}

# プライベートサブネットの作成
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.ssm_test.id
  cidr_block              = var.private_subnet_cidr1
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false
}

