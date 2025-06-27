data "aws_iam_policy_document" "cert_manager_route53_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringEquals"
      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"
      values   = ["system:serviceaccount:cert-manager:cert-manager"]
    }
  }
}

resource "aws_iam_role" "cert_manager_route53" {
  name               = "cert-manager-route53-role"
  assume_role_policy = data.aws_iam_policy_document.cert_manager_route53_assume_role.json
}

resource "aws_iam_policy" "cert_manager_route53" {
  name        = "cert-manager-route53-policy"
  description = "Allow cert-manager to manage Route53 DNS validation"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "route53:GetChange",
          "route53:ChangeResourceRecordSets",
          "route53:ListResourceRecordSets",
          "route53:ListHostedZones"
        ]
        Resource = ["arn:aws:route53:::hostedzone/${var.route53_zone_id}"]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cert_manager_route53_attach" {
  role       = aws_iam_role.cert_manager_route53.name
  policy_arn = aws_iam_policy.cert_manager_route53.arn
}
