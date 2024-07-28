# create private key for CA
resource "tls_private_key" "ishika_ca_private_key" {
  algorithm = "RSA"
}

resource "local_file" "ishika_ca_key" {
  content  = tls_private_key.ishika_ca_private_key.private_key_pem
  filename = "${path.module}/certs/ishika_ca_private.key"
}

# Create private CA Certificate
resource "tls_self_signed_cert" "ishika_ca_cert" {
  private_key_pem = tls_private_key.ishika_ca_private_key.private_key_pem

  is_ca_certificate = true

  subject {
    country             = "IE"
    province            = "Dublin"
    locality            = "Blackrock"
    common_name         = "Ishika Root CA"
    organization        = "Ishika Pvt Ltd."
    organizational_unit = "Ishika Root Certification Authority"
  }

  validity_period_hours = 43800 //  1825 days or 5 years

  allowed_uses = [
    "digital_signature",
    "cert_signing",
    "crl_signing",
  ]
}

resource "local_file" "ishika_ca_cert" {
  content  = tls_self_signed_cert.ishika_ca_cert.cert_pem
  filename = "${path.module}/certs/ishika_ca_cert.cert"
}