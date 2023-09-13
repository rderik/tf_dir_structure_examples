output "s3_bucket_domain" {
  value = aws_s3_bucket_website_configuration.static_site.website_endpoint
}

output "cloudfront_distribution_id" {
  value     = var.environment == "prod" ? aws_cloudfront_distribution.s3_distribution[0].id : "not-available"
}
