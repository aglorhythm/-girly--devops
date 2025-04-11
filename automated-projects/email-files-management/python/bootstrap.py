#!/usr/bin/env python3
"""
# Author: @aglorhythm
# Initial configurations
"""

from dotenv import load_dotenv
import os
import subprocess
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


if __name__ == '__main__':

    new_creds = get_temporary_creds()
    env = {
        "TF_VAR_aws_access_key_id": new_creds["access_key"],
        "TF_VAR_aws_secret_access_key": new_creds["secret_key"],
        "TF_VAR_aws_session_token": new_creds["session_token"],
        "TF_VAR_aws_region": os.getenv("AWS_DEFAULT_REGION"),
        "TF_VAR_environment": os.getenv("ENV")
    }

    # run terraform
    terraform_dir = "../terraform"
    subprocess.run(
        ["tofu", "init"],
        cwd=terraform_dir,
        env={**os.environ, **env}
    )

    subprocess.run(
        ["tofu", "plan"],
        cwd=terraform_dir,
        env={**os.environ, **env}
)


