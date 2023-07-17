# Terraform

## Usage

1. Set .envrc
   - `export GOOGLE_CLOUD_KEYFILE_JSON=''`
   - `export GOOGLE_BACKEND_CREDENTIALS=''`
2. cd either dev/, stg/, prod/
3. `terraform login`
4. `terraform init`
5. `terraform plan -var-file=tfvars.json`
6. `terraform apply -var-file=tfvars.json`

[Architecture and CI/CD](https://www.figma.com/file/z0wL2E7mvqkDGmF9NprSyU/Otomo-Dev?type=design&node-id=0-1&mode=design&t=Usf3ebcbkUVzcvLG-11)

## Solving Errors

- Google storage foribn
  - https://github.com/hashicorp/terraform/issues/17222

## TODO

- [ ] Import secret information from Secret Manager
  - secrets
    - google_application_credentials_json
    - basic_auth_pairs
- [ ] Make GCP project for each environments and deploy.
  - if without this todo and deploy, I have to change GCP_PROJECT_ID by myself without production environment
