output "s3_bucket_domain" {
  value = module.static_site_bucket.regional_domain_name
}

output "s3_website_domain" {
  value = module.static_site_bucket.website_domain_name
}
