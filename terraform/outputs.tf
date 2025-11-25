output "alb_dns_name" {
  value       = aws_lb.ui.dns_name
  description = "ALB DNS name"
}
