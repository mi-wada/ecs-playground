# References:
# - https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc.html
# - https://docs.github.com/en/actions/how-tos/secure-your-work/security-harden-deployments/oidc-in-aws

resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = [
    "sts.amazonaws.com"
  ]
}

resource "aws_iam_role" "github_actions" {
  name = "GitHubActionsRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github_actions.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:mi-wada/ecs-playground:*"
          }
        }
      }
    ]
  })
}

data "aws_iam_policy" "administrator_access" {
  # TODO: change later
  name = "AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "github_actions" {
  role       = aws_iam_role.github_actions.name
  policy_arn = data.aws_iam_policy.administrator_access.arn
}
