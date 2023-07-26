# Terraform

## Usage

1. cd either environments/dev/, stg/ or prod/
1. `touch .envrc`
   - `export GOOGLE_CLOUD_KEYFILE_JSON=''`
   - `export GOOGLE_BACKEND_CREDENTIALS=''`
1. `touch tfvars.json`
1. `terraform login`
1. `terraform init`
1. `terraform plan -var-file=tfvars.json`
1. `terraform apply -var-file=tfvars.json`

[Architecture and CI/CD](https://www.figma.com/file/z0wL2E7mvqkDGmF9NprSyU/Otomo-Dev?type=design&node-id=0-1&mode=design&t=Usf3ebcbkUVzcvLG-11)

## Create a new project

1. Create a new project on GCP
   - I want to make terraform including creating a new GCP project. But maybe I have to have a organization for assigning the Project Creator role.
1. Create a service account having Owner role for Terraform
1. Download the credentials.
1. Follow [usage section](#usage)

## Solving Errors

- [Google storage forbin](https://github.com/hashicorp/terraform/issues/17222)

## TODO

- [ ] Import secret information from Secret Manager
  - secrets
    - google_application_credentials_json
    - basic_auth_pairs
