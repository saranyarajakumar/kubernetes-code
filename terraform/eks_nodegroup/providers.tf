provider "aws" {
  region = "eu-west-2"
  
}
terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = ">=2.11.0"  # Use the latest version available
    }
  }

  backend "s3" {
    region = "eu-west-2"
    bucket = "devops123-terra"
    key    = "eks_cluster_3.tfstate"
  }
}
