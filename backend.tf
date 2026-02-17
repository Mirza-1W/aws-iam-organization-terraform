terraform {
  backend "s3" {
    bucket         = "technova-terraform-state-mmu6991"
    key            = "iam-organization/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}