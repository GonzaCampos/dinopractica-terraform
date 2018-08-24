terraform {
  required_version = "> 0.11.0"

  backend "s3" {
    bucket = "terraform-dinopractica"
    key    = "tf.state"
    region  = "us-west-2"
  }
}

provider "aws" {
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  region     = "us-west-2"
}
