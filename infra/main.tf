
provider "aws" {
  region = "eu-north-1"
}


terraform {
  required_version = "~> 1.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "spender-guardian-storage"
    key            = "spender-guardian-mono/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

output "ecr_repository_url" {
  description = "The full URL of the ECR repository."
  value       = aws_ecr_repository.app_repo.repository_url
}