#!/bin/bash

top_level="$(git rev-parse --show-toplevel)"

for env in dev prod ; do
	echo "=== $env ==="

	# Go to repo top level
	cd "$top_level/live"

	bucket_name="$(tofu output -raw "${env}_s3_bucket_name")"

	# Sync the static dir with the bucket
	cd "$top_level/dist/static/$env"
	aws s3 sync . "s3://$bucket_name/"
done
