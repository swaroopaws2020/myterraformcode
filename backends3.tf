terraform {
  backend "s3" {
    bucket = "myterraform-code"
    key    = "terraformcode/myterraformcode.tfstate"
    region = "us-east-1"

    dynamodb_table = "myterraform-code_lock"
    encrypt        = true
  }
}