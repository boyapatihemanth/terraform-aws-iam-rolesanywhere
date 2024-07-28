# Create server cert signed by CA
# Create private key for server certificate
resource "tls_private_key" "ishika_internal" {
  algorithm = "RSA"
}

resource "local_file" "ishika_internal_key" {
  content  = tls_private_key.ishika_internal.private_key_pem
  filename = "${path.module}/certs/dev.ishika.key"
}

# Create CSR for for server certificate
resource "tls_cert_request" "ishika_internal_csr" {

  private_key_pem = tls_private_key.ishika_internal.private_key_pem

  dns_names = ["dev.ishika.internal"]

  subject {
    country             = "IE"
    province            = "Dublin"
    locality            = "Blackrock"
    common_name         = "Ishika Internal Development "
    organization        = "Ishika"
    organizational_unit = "Development"
  }
}

# Sign Server Certificate by Private CA
resource "tls_locally_signed_cert" "ishika_internal_signed_cert" {
  // CSR by the development servers
  cert_request_pem = tls_cert_request.ishika_internal_csr.cert_request_pem
  // CA Private key
  ca_private_key_pem = tls_private_key.ishika_ca_private_key.private_key_pem
  // CA certificate
  ca_cert_pem = tls_self_signed_cert.ishika_ca_cert.cert_pem

  validity_period_hours = 43800

  allowed_uses = [
    "digital_signature",
    "key_encipherment",
    "server_auth",
    "client_auth",
  ]
}

resource "local_file" "ishika_internal_signed_cert" {
  content  = tls_locally_signed_cert.ishika_internal_signed_cert.cert_pem
  filename = "${path.module}/certs/dev.ishika.cert"
}