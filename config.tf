terraform {
  backend "s3" {
    bucket         = "jamf-interview-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "eu-south-1"
    dynamodb_table = "jamf-interview-lock-state-table"
    encrypt        = true
  }
}
