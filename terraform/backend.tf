terraform {
  backend "s3" {
    bucket = "amzn-s3-serverless-bucket"
    key    = "terraform/state/production.tfstate"
    region = "ap-southeast-2"
    use_lockfile = true
    encrypt        = true
  }
}
