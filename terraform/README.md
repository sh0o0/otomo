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
- Error waiting to create Service: resource is in failed state "Ready:False", message: Revision 'xxx-xxx-xxx' is not ready and cannot serve traffic.
  - Due to
    - not uploading the image to gcr
  - How to solve
    - upload the image named api to gcr
- Attempted to load application default credentials since neither `credentials` nor `access_token` was set in the provider block. No credentials loaded. To use your gcloud credentials, run 'gcloud auth application-default login'
  - Due to
    - not set GOOGLE_CREDENTIALS env
  - How to solve
    - set GOOGLE_CREDENTIALS env to Terraform Cloud
- Error creating RegionNetworkEndpointGroup: googleapi: Error 403: Compute Engine API has not been used in project 38690732421 before or it is disabled. Enable it by visiting https://console.developers.google.com/apis/api/compute.googleapis.com/overview?project=38690732421 then retry. If you enabled this API recently, wait a few minutes for the action to propagate to our systems and retry.
  - Due to
    - Maybe enabling the service is late.
  - How to solve
    - Retry terraform apply
- Error creating AndroidApp: googleapi: Error 400: Request contains an invalid argument. with module.otomo.module.firebase.google_firebase_android_app.default.
  - Due to
    - I don't know. But I retried and no error.
  - How to solve
    - Retry terraform apply

## TODO

- [ ] Import secret information from Secret Manager
  - secrets
    - google_application_credentials_json
    - basic_auth_pairs
