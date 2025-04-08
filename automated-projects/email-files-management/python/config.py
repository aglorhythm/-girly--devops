#!/usr/bin/env python3
# ===================================
# Author: @aglorhythm
# Configurations
# ===================================

from dotenv import load_dotenv
import os
import boto3

# load environment variables
load_dotenv()

# aws setup
aws_access_key_id = os.getenv("AWS_ACCESS_KEY_ID")
aws_secret_access_key = os.getenv("AWS_SECRET_ACCESS_KEY")
s3 = boto3.resource('s3')

# terraform
os.environ["TF_VAR_aws_access_key_id"] = os.getenv("AWS_ACCESS_KEY_ID", "")
os.environ["TF_VAR_aws_secret_access_key"] = os.getenv("AWS_SECRET_ACCESS_KEY", "")
os.environ["TF_VAR_aws_default_region"] = os.getenv("AWS_DEFAULT_REGION", "")