terraform {
  backend "s3" {
    bucket = "myterraform-code"
    key    = "terraformcode/myterraformcode.tfstate"
    region = "us-east-1"
  }
}