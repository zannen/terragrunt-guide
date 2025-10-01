terraform {
  # This bucket is not provisioned automatically, so:
  # aws s3api create-bucket --bucket 'terragrunt-to-terralith-tfstate-20250930-174455' --region 'eu-west-2' --create-bucket-configuration LocationConstraint=eu-west-2
  # aws s3api put-bucket-versioning --bucket 'terragrunt-to-terralith-tfstate-20250930-174455' --versioning-configuration 'Status=Enabled'
  backend "s3" {
    bucket       = "terragrunt-to-terralith-tfstate-20250930-174455"
    key          = "prod/tofu.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}
