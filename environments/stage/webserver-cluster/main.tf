# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Configure the state
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


terraform {
  # This module is now only being tested with Terraform 1.1.x. However, to make upgrading easier, we are setting 1.0.0 as the minimum version.
  required_version = ">= 1.0.0"
#  backend "s3" {
#    # Replace this with your bucket name!
#    bucket         = "terraform-state-stage-822924082960"
#    key            = "global/s3/terraform.tfstate"
#    region         = "us-east-2"
#    # Replace this with your DynamoDB table name!
#    dynamodb_table = "terraform-up-and-running-locks-stage"
#    encrypt        = true
#  }
}

# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = "us-east-2"
}


# ------------------------------------------------------------------------------
# DEPLOY THE WEBSERVER-CLUSTER MODULE
# ------------------------------------------------------------------------------


module "webserver_cluster" {
  source = "../../../modules/webserver-cluster"

  cluster_name  = "webservers-stage"
  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 1
}
