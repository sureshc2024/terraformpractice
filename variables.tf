variable "region" {
  type = string
  description = "aws region for deployment"
}

variable "bucketname" {
  type = string
  description = "s3 bucket name to store statefile"
  
}
variable "dynamodbtable" {
  type = string
  description = "dynamodb table for state locking"
  
}