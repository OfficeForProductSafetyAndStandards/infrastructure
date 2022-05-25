Terraform module to support the [Product Safety Database (PSD)](https://github.com/UKGovernmentBEIS/beis-opss-psd/).

## Additional infrastructure

Not all the resources required by the Product Safety Database are provisioned by this module.

- [UKGovernmentBEIS/psd-file-export-report-checker](https://github.com/UKGovernmentBEIS/psd-file-export-report-checker/) deploys a Lambda function directly, and the team manages its associated IAM policies
