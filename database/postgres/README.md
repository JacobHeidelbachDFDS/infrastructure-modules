# Terraform aws rds postgres module
This module is designed to create a database based on an exisiting snapshot with the recommended settings like ssl.

The connection strings, passwords etc can be found in parameter store in the same account/region as the database.

## Input rewuirements (Values are only for examples)
* db_name = "papp" (Destructive if changed)
* aws_region = "eu-central-1" (Destructive if changed)
* application = "application" (Destrutive if changed)
* db_master_username = "test" (Destrutive if changed)
* db_master_password = "testtesttest" (Can be used for changing password)
* skip_final_snapshot = false (Optional and should NOT be set to true for production)

* performance_insights_enabled = false (Optional - Specifies whether Performance Insights are enabled
* performance_insights_retention_period = 7 (Optional - The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years). When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true.)