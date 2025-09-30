#!/bin/bash

# Get the bucket name
bucket_name="$(tofu output -raw s3_bucket_name)"

# Go to repo top level
cd "$(git rev-parse --show-toplevel)"

# Sync the static dir with the bucket
cd dist/static
aws s3 sync . "s3://${bucket_name}/"
