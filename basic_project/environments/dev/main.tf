module "static_site_bucket" {
  source      = "../../modules/static_site"
  environment = var.environment
  project_id  = var.project_id
  index_file  = var.index_file
}
