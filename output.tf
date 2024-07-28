output "trust_anchor_arn" {
  value = aws_rolesanywhere_trust_anchor.ishika_rolesanywhere_trust_anchor.arn
  description = "ARN of rolesanywhere trust anchor"
}

output "profile_arn" {
  value = aws_rolesanywhere_profile.ishika_rolesanywhere_profile.arn
  description = "ARN of rolesanywhere profile"
}

output "role_arn" {
  value = aws_iam_role.ishika_rolesanywhere_admin_role.arn
  description = "ARN of iam role"
}

output "aws_cli_to_run" {
  value = "./aws_signing_helper credential-process --certificate ${local_file.ishika_internal_signed_cert.filename} --private-key ${local_file.ishika_internal_key.filename} --profile-arn ${aws_rolesanywhere_profile.ishika_rolesanywhere_profile.arn} --role-arn ${aws_iam_role.ishika_rolesanywhere_admin_role.arn} --trust-anchor-arn ${aws_rolesanywhere_trust_anchor.ishika_rolesanywhere_trust_anchor.arn}"
}