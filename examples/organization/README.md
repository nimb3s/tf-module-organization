# Setup
Install docker desktop on [Mac](https://docs.docker.com/desktop/install/mac-install/) or install on [Windows](https://docs.docker.com/desktop/install/windows-install/)

[Install LocalStack](https://docs.localstack.cloud/getting-started/installation/)
[Install `awslocal`](https://docs.localstack.cloud/user-guide/integrations/aws-cli/#localstack-aws-cli-awslocal)

## Run localstack using docker
`docker run --rm -it -p 4566:4566 -p 4510-4559:4510-4559 -e LOCALSTACK_API_KEY=REPLACE_WITH_YOUR_API_KEY localstack/localstack-pro`

## Terraform
Update the terraform.tfvars with your info

Run terraform init and apply to provision your infrastructure in localstack
```tf
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -auto-approve -var-file=terraform.tfvars
```

## awslocal
Run `awslocal organizations list-roots`. You should see the org root with he master account id of 000000000000

```json
{
    "Organization": {
        "Id": "o-nasypzr6y9",
        "Arn": "arn:aws:organizations::000000000000:organization/o-nasypzr6y9",
        "FeatureSet": "ALL",
        "MasterAccountArn": "arn:aws:organizations::000000000000:account/o-nasypzr6y9/000000000000",        
        "MasterAccountId": "000000000000",
        "MasterAccountEmail": "master@example.com",
        "AvailablePolicyTypes": [
            {
                "Type": "SERVICE_CONTROL_POLICY",
                "Status": "ENABLED"
            }
        ]
    }
}
```

Run `awslocal organizations list-accounts`. You should see the root account along with the development and production account

```json
{
    "Accounts": [
        {
            "Id": "000000000000",
            "Arn": "arn:aws:organizations::000000000000:account/o-nasypzr6y9/000000000000",
            "Email": "master@example.com",
            "Name": "master",
            "Status": "ACTIVE",
            "JoinedMethod": "CREATED",
            "JoinedTimestamp": "2023-05-23T22:46:22.217632-07:00"
        },
        {
            "Id": "752162847085",
            "Arn": "arn:aws:organizations::000000000000:account/o-nasypzr6y9/752162847085",
            "Email": "myusername+aws_learning_production@gmail.com",
            "Name": "learning_production",
            "Status": "ACTIVE",
            "JoinedMethod": "CREATED",
            "JoinedTimestamp": "2023-05-23T22:46:22.504257-07:00"
        },
        {
            "Id": "451366279471",
            "Arn": "arn:aws:organizations::000000000000:account/o-nasypzr6y9/451366279471",
            "Email": "myusername+aws_learning_develop@gmail.com",
            "Name": "learning_develop",
            "Status": "ACTIVE",
            "JoinedMethod": "CREATED",
            "JoinedTimestamp": "2023-05-23T22:46:22.527613-07:00"
        }
    ]
}