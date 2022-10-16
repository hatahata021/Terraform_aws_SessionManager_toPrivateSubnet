resource "aws_iam_role" "ec2role_allow_ssm" {
  name               = "ec2role_allow_ssm"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ec2role_attach" {
  role = aws_iam_role.ec2role_allow_ssm.name
  # IAMポリシーのARNを確認するCLIコマンド
  # aws iam list-policies --scope AWS --query "Policies[?PolicyName=='<ロールの名前>'].Arn" --output text
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}