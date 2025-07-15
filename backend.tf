terraform {
  backend "s3" {
    bucket = "tf-backend-s3-bucket-testing" //Created bucker name where we have to store.
    key    = "terraform.tfstate"
    region = "us-east-1" //region where the bucket is placed.
  }
}