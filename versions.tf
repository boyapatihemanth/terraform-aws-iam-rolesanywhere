terraform {
  required_providers {
    tls = {
      source = "hashicorp/tls"
      version = "4.0.5"
    }
    local = {
      source = "hashicorp/local"
      version = "2.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}