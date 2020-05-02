data "aws_iam_policy_document" "instances" {
  statement {
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeVolume*",
    ]
  }
}

resource "aws_iam_policy" "instances" {
  name   = "${var.project_name}_neo4j_instances"
  policy = data.aws_iam_policy_document.instances.json
}

resource "aws_iam_role_policy_attachment" "instances_core" {
  role       = aws_iam_role.role.id
  policy_arn = aws_iam_policy.instances.arn
}


data "aws_iam_policy_document" "cwlogs" {
  statement {
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]
  }
}

resource "aws_iam_policy" "cwlogs" {
  name   = "${var.project_name}_cwlogs"
  policy = data.aws_iam_policy_document.cwlogs.json
}

resource "aws_iam_role_policy_attachment" "cwlogs_core" {
  role       = aws_iam_role.role.id
  policy_arn = aws_iam_policy.cwlogs.arn
}


resource "aws_iam_instance_profile" "profile" {
  name = "profile_${var.project_name}_neo4j"
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = "role_${var.project_name}_neo4j"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
