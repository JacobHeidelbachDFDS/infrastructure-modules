# --------------------------------------------------
# Init
# --------------------------------------------------

terraform {
  backend          "s3"             {}
  required_version = "~> 0.12.2"
}

provider "aws" {
  region  = var.aws_region
  version = "~> 2.15"  # from 2.11 Minimum required 2.14

  assume_role {
    role_arn = var.aws_assume_role_arn
  }
}

# --------------------------------------------------
# Cloudfront distribution setup
# --------------------------------------------------

module "aws_cf_oai" {
  source       = "../../_sub/cdn/cloudfront_oai"
  comment = "${var.cf_dist_comment} user for accessing s3 buckets"
}


module "aws_cf_dist" {
  source       = "../../_sub/cdn/cloudfront_dist"
  origins = var.cf_dist_origins
  cache_behaviors = var.cf_dist_cache_behaviors
  acm_certificate_arn = "${var.cf_dist_domain_certificate_arn}"
  comment = var.cf_dist_comment
  aliases = "${length(var.cf_dist_domain_name) == 0 ? [] : [var.cf_dist_domain_name]}"
  # lambda_edge_qualified_arn = "${var.deploy_lambda_edge_func ? module.aws_cf_dist_default_behavior_lambda_function.lambda_function_qualified_arn : null }"
   # FIXME: It's not enough to remove the association. You need to wait for at least 30 minutes before AWS removes all replicas of the lambda@edge function
   # TODO: A local exec function that listen to 
  origin_access_identity = "${module.aws_cf_oai.origin_access_identity}"
  logging_enable = "${var.cf_dist_logging_enable}"  
  logging_include_cookies= "${var.cf_dist_logging_include_cookies}"
  logging_bucket = "${var.cf_dist_logging_bucket}"
  logging_prefix = "${var.cf_dist_logging_prefix}"
}

# --------------------------------------------------
# Default behavior lambda@edge setup
# --------------------------------------------------

# # Lambda@funtion to manipulating http request
# module "aws_cf_dist_default_behavior_lambda_function" { 
#   source = "../../_sub/compute/lambda-edge"
#   deploy = "${var.deploy_lambda_edge_func}"
#   lambda_function_name = "${local.lamda_edge_prefix}-cf-redirect-rules"
#   lambda_role_name = "${local.lamda_edge_prefix}-cf-default-redirect-rules"

#   lambda_function_handler = "${var.cf_dist_lambda_function_handler}" 
#   # aws_region = "${var.aws_region}"
#   s3_bucket = "${module.s3_bucket.bucket_name}"
#   s3_key = "${module.s3_object_upload_lambda_edge.s3_object_key}"
#   publish = true
# }

# # TODO: should be produced via CD pipeline
# module "s3_object_upload_lambda_edge" { 
#   source = "../../_sub/misc/s3-bucket-object"
#   deploy = "${var.deploy_lambda_edge_func}"
#   s3_bucket = "${module.s3_bucket.bucket_name}"
#   key = "${var.cf_dist_lambda_edge_zip_filepath}"
#   filepath = "${var.cf_dist_lambda_edge_zip_filepath}"
# }

# # Bucket for lambda function
# module "s3_bucket" { 
#   source = "../../_sub/storage/s3-bucket"
#   deploy = "${var.deploy_lambda_edge_func ? 1: 0}" # TODO: Change to boolean (requires change in sub module)
#   s3_bucket = "${var.cf_dist_lambda_s3bucket}"
# }
