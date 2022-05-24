# terraform

## The first time you use this code

### Creating an AWS profile

This code uses a named AWS profile and all AWS access will be performed using the credentials stored within it.

```sh
aws configure --profile beis-opss-infrastructure
```

This step will ask you for your Access key ID, and Secret, and a default region (use `eu-west-2`). You will need to be in the `terraformers` group. Terraform manages this group, but group membership is managed separately by an administrator.

### Downloading the terraform provider modules

```sh
terraform init
```

## Making and deploying changes

```sh
# To see what changes will be made
terraform plan -var 'aws_profile=beis-opss-infrastructure'

# To make those changes
terraform apply -var 'aws_profile=beis-opss-infrastructure'
```

## Switching to another AWS aws_profile/testing out changes

If you'd like to target another AWS account, for example production or a test environment, use a different terraform workspace and different AWS profiles:

```sh
terraform workspace select test
terraform plan -var 'aws_profile=beis-opss-infrastructure-test'
terraform apply -var 'aws_profile=beis-opss-infrastructure-test'
```
