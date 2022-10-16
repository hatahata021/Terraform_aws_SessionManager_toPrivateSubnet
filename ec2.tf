data "aws_ami" "AmazonLinux2" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_iam_instance_profile" "ec2role_allow_ssm" {
  name = "ec2role_allow_ssm"
  role = aws_iam_role.ec2role_allow_ssm.name

}

resource "aws_instance" "ssm_test_instance" {
  ami                  = data.aws_ami.AmazonLinux2.id
  instance_type        = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2role_allow_ssm.id
  subnet_id            = aws_subnet.private_subnet.id

  # 以下の引数を明示的に指定することで、VPC作成時に作られるデフォルトSGを外すことができる
  vpc_security_group_ids = [aws_security_group.allow_https_egress.id]

  tags = {
    Name = var.tags
  }
}
