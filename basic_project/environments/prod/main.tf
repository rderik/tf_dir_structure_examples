module "static_site_bucket" {
  source      = "../../modules/static_site"
  environment = var.environment
  project_id  = var.project_id
  index_file  = var.index_file
}

module "distribution" {
  source      = "../../modules/cloudfront_distribution"
  environment = var.environment
  project_id  = var.project_id
  domain_name = module.static_site_bucket.regional_domain_name
  origin_id   = module.static_site_bucket.bucket
}
