output "aws_account_id" {
  value = "${aws_organizations_account.dfds.id}"
}

output "aws_account_name" {
  value = "${aws_organizations_account.dfds.name}"
}