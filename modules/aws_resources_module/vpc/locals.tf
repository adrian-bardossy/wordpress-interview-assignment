locals {
  vpc_name         = "jamf_vpc"
  vpc_subnet       = "10.0.0.0/16"
  azs              = ["eu-south-1a", "eu-south-1b"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets   = ["10.0.3.0/24", "10.0.4.0/24"]
  database_subnets = ["10.0.5.0/24", "10.0.6.0/24"]
}
