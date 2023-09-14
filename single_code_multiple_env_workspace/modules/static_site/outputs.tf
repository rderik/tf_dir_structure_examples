output "regional_domain_name" {
  value = aws_s3_bucket.static_site.bucket_regional_domain_name
}

output "website_domain_name" {
  value = "http://${aws_s3_bucket.static_site.bucket}.${aws_s3_bucket_website_configuration.static_site.website_domain}"
}

output "bucket" {
  value = aws_s3_bucket.static_site.bucket
}
