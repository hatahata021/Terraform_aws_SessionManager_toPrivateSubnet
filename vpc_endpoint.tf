resource "aws_vpc_endpoint" "ssm_endpoint" {
  service_name      = "com.amazonaws.ap-northeast-1.ssm"
  vpc_id            = aws_vpc.ssm_test.id
  vpc_endpoint_type = "Interface"
  subnet_ids        = [aws_subnet.private_subnet.id]
  security_group_ids = [
    aws_security_group.allow_https_ingress.id,
  ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssmmessage_endpoint" {
  service_name      = "com.amazonaws.ap-northeast-1.ssmmessages"
  vpc_id            = aws_vpc.ssm_test.id
  vpc_endpoint_type = "Interface"
  subnet_ids        = [aws_subnet.private_subnet.id]
  security_group_ids = [
    aws_security_group.allow_https_ingress.id,
  ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2message_endpoint" {
  service_name      = "com.amazonaws.ap-northeast-1.ec2messages"
  vpc_id            = aws_vpc.ssm_test.id
  vpc_endpoint_type = "Interface"
  subnet_ids        = [aws_subnet.private_subnet.id]
  security_group_ids = [
    aws_security_group.allow_https_ingress.id,
  ]
  private_dns_enabled = true
}