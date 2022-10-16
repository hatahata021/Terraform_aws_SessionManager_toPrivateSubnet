# EC2にアタッチするSG
resource "aws_security_group" "allow_https_egress" {
  name   = "allow_https_egress"
  vpc_id = aws_vpc.ssm_test.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_https_egress.id
}

# VPCエンドポイントにアタッチするSG
resource "aws_security_group" "allow_https_ingress" {
  name   = "allow_https_ingress"
  vpc_id = aws_vpc.ssm_test.id
}

resource "aws_security_group_rule" "ingress" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.allow_https_egress.id
  security_group_id        = aws_security_group.allow_https_ingress.id
}