locals {
  cf_dist_comment_lower = "${lower(var.cf_dist_comment)}"

  lamda_edge_prefix = "${replace(local.cf_dist_comment_lower, " ", "-")}"
}
