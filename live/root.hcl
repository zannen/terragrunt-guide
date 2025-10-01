remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket       = "terragrunt-to-terralith-tfstate-20250930-174455"
    key          = "${path_relative_to_include()}/tofu.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "eu-west-2"
}
EOF
}