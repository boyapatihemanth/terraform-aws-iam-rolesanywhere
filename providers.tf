provider "tls" {}
provider "local" {}
provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      managed_by = "terraform_code"
    code_location = "/Users/hemanthboyapati/code/terraform/terraform-iam-rolesanywhere"
    vcs_source_code = "github"
    repo = "boyapatihemanth/terraform-iam-rolesanywhere"
    }
  }
}
