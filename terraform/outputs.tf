# output "alb_dns_name" {
#   value       = aws_lb.ui.dns_name
#   description = "ALB DNS name"
# }

output "github_actions_role_arn" {
  value       = aws_iam_role.github_actions.arn
  description = "IAM role ARN for GitHub Actions (use in `role-to-assume`)"
}
