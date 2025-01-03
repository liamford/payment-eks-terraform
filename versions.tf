terraform {
  required_version = ">= 1.6.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "liam_org"

    workspaces {
      name = "payment-infrastructure"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.75.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = ">= 4.0.4"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"

  default_tags {
    tags = {
      Environment = "prod"
      Team        = "Payments"
      Service     = "eks"
    }
  }
}
