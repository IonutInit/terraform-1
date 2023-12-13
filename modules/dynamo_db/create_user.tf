resource "aws_iam_user" "dynamodb_user" {
  name = var.dynamodb_user
}

resource "aws_iam_user_policy_attachment" "dynamodb_full_access" {
  user       = aws_iam_user.dynamodb_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_access_key" "dynamodb_user_key" {
  user = aws_iam_user.dynamodb_user.name
}
