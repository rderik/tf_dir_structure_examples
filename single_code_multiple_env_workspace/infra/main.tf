module "static_site_bucket" {
  source      = "../modules/static_site"
  environment = terraform.workspace
  project_id  = var.project_id
  index_file  = var.index_file
}

module "distribution" {
  count       = terraform.workspace == "prod" ? 1 : 0
  source      = "../modules/cloudfront_distribution"
  environment = terraform.workspace
  project_id  = var.project_id
  domain_name = module.static_site_bucket.regional_domain_name
  origin_id   = module.static_site_bucket.bucket
}
