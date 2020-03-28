variable "aws_region" {
    type = "string"
}


variable "application" {
  type = "string"
}

variable "db_name" {
  type = "string"
}

variable "db_master_username" {
  type = "string"
}

variable "db_master_password" {
  type = "string"
}

variable "environment" {
    type = "string"
    default = "prod"
}

variable "db_port" {
  default     = 1433
  description = "The port to use for the database"
}

variable "skip_final_snapshot" {
  description = "Define if the default of creating a backup upon deletion should be skipped. Default is false"
  default = false
}

variable "db_instance_class" {
  description = "The instance class of the DB (e.g. db.t2.micro)"
  default     = "db.t2.micro"
}

variable "performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled. Default is false."
  default = false
}

variable "performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true. Default is '7'."
  default = 7
}