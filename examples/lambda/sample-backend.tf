# terraform {
#   backend "s3" {
#     bucket         = "my-bucket-tfstate"
#     key            = "ex-cloudwatch-event-rule-lambda"
#     profile        = "my-profile"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-lock"
#   }
# }
