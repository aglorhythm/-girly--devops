#!/usr/bin/env python3
"""
# Author: @aglorhythm
# Initial configurations
"""

from dotenv import load_dotenv
import os
import subprocess
from pathlib import Path

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

    try:
        new_creds = get_temporary_creds()
        env = {
            "TF_VAR_aws_access_key_id": new_creds["access_key"],
            "TF_VAR_aws_secret_access_key": new_creds["secret_key"],
            "TF_VAR_aws_session_token": new_creds["session_token"],
            "TF_VAR_aws_region": os.getenv("AWS_DEFAULT_REGION"),
            "TF_VAR_environment": os.getenv("ENV"),
            "TF_VAR_ovh_app_key": os.getenv("OVH_APP_KEY"),
            "TF_VAR_ovh_app_secret": os.getenv("OVH_APP_SECRET"),
            "TF_VAR_ovh_consumer_key": os.getenv("OVH_CONSUMER_KEY"),

        }

        # run terraform
        tf_dir = "../terraform"
        tf_plan = "tf-plan"
        print('hey:', os.getcwd())

        subprocess.run(
            ["tofu", "init"],
            cwd=tf_dir,
            env={**os.environ, **env}
        )

        subprocess.run(
            ["tofu", "refresh"],
            cwd=tf_dir,
            env={**os.environ, **env}
        )

        subprocess.run(
            ["tofu", "plan", f"-out={tf_plan}"],
            cwd=tf_dir,
            env={**os.environ, **env}
        )

        plan_path = Path(f"{tf_dir}/{tf_plan}")
        if plan_path.is_file():
            subprocess.run(
                ["tofu", "apply", tf_plan],
                cwd=tf_dir,
                env={**os.environ, **env}
            )
        else:
            print("Plan  file can't be found.")

        # subprocess.run(
        #     ["tofu", "destroy"],
        #     cwd=tf_dir,
        #     env={**os.environ, **env}
        # )

    except Exception as err:
        print(err)


