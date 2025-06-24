terraform {
  backend "s3" {
    bucket         = "jamf-interview-terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "eu-south-1"
    dynamodb_table = "terraform-lock-state-file"
    encrypt        = true
  }
}
