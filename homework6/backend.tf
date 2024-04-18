terraform {
  backend "s3" {
    bucket = "mybucket-jkk"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
  
}
}