resource "aws_dynamodb_table" "myterraform-code_lock" {
  name             = "myterraform-code_lock"
  hash_key         = "LockId"
  billing_mode     = "PAY_PER_REQUEST"
  
  attribute {
    name = "LockId"
    type = "S"
  }
}