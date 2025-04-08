#!/usr/bin/env python3
"""
# Author: @aglorhythm
# Initial configurations
"""

from dotenv import load_dotenv
import os
import boto3

load_dotenv()
role_arn = os.getenv("TF_ROLE_ARN")

def get_temporary_creds():
    sts = boto3.client('sts')
    role = sts.assume_role(RoleArn=role_arn, RoleSessionName="efm-python-bootstrap")

    creds = {
        "access_key": role["Credentials"]["AccessKeyId"],
        "secret_key": role["Credentials"]["SecretAccessKey"],
        "session_token": role["Credentials"]["SessionToken"],
    }
    return creds

def set_terraform_aws_config(access_key: str, secret_key: str, session_token: str) -> None:
    os.environ["TF_VAR_aws_access_key_id"] = access_key
    os.environ["TF_VAR_aws_secret_access_key"] = secret_key
    os.environ["TF_VAR_token"] = secret_key = session_token
    os.environ["TF_VAR_aws_default_region"] = os.getenv("AWS_DEFAULT_REGION")


new_creds = get_temporary_creds()
set_terraform_aws_config(
    access_key=new_creds["access_key"],
    secret_key=new_creds["secret_key"],
    session_token=new_creds["session_token"]
)
