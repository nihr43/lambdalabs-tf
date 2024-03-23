variable "LAMBDA_TOKEN" {}

terraform {
  required_providers {
    lambdalabs = {
      source = "elct9620/lambdalabs"
    }
  }
}

provider "lambdalabs" {
  api_key = var.LAMBDA_TOKEN
}
