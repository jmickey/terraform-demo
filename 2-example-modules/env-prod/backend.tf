terraform {
  backend "s3" {
    bucket  = "<some-s3-bucket>"
    key     = "tf_demo/prod/terraform.tfstate"
    region  = "ap-southeast-2"
    encrypt = true
  }
}
