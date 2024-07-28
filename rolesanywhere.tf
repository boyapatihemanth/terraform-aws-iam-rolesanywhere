resource "aws_rolesanywhere_trust_anchor" "ishika_rolesanywhere_trust_anchor" {
  name = "ishika_ca_cert"
  enabled = true
  source {
    source_data {
      x509_certificate_data = tls_self_signed_cert.ishika_ca_cert.cert_pem
    }
    source_type = "CERTIFICATE_BUNDLE"
  }
}

resource "aws_iam_role" "ishika_rolesanywhere_admin_role" {
  name = "ishika_rolesanywhere_admin_role"
  path = "/"
  assume_role_policy = data.aws_iam_policy_document.ishika_rolesanywhere_trust.json
}

resource "aws_iam_policy" "ishika_rolesanywhere_admin_policy" {
  name        = "ishika_rolesanywhere_admin_policy"
  path        = "/"
  description = "IAM Policy for rolesanywhere iam role"
  policy = data.aws_iam_policy_document.ishika_rolesanywhere_iam_policy_permissions.json
}

resource "aws_iam_role_policy_attachment" "ishika_rolesanywhere_iam_role_policy_attachment" {
  role = aws_iam_role.ishika_rolesanywhere_admin_role.name
  policy_arn = aws_iam_policy.ishika_rolesanywhere_admin_policy.arn
}

resource "aws_rolesanywhere_profile" "ishika_rolesanywhere_profile" {
  name      = "ishika_admin_profile"
  enabled = true
  role_arns = [aws_iam_role.ishika_rolesanywhere_admin_role.arn]
}