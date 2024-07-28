terraform {
  backend "remote" {
    organization = "boyapatihemanth"
    workspaces {
      name = "boyapatihemanthnl-rolesanywhere"
    }
  }
}