# Terraform Playground

## Pre-requisites 

### Terraform

- [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli#install-terraform)
- [Install Autocomplete package](terraform -install-autocomplete)
- [Terraform Cloud account](https://app.terraform.io/session)
  - Login locally: `terraform login`

### Azure

- [Azure account](https://azure.microsoft.com/en-us/pricing/purchase-options/azure-account)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

## General

### Commands

- Initialize a project: `terraform init`
- Format: `terraform fmt`
- Dry-run: `terraform plan`
- Deploy: `terraform apply`
- Destroy: `terraform destroy`

## Git Hooks

This repository contains Git Hooks located in the [.githooks](.githooks) directory. You can opt-in to use them locally by running the following command from the root of this repository:

```shell
git config --local core.hooksPath .githooks
```

- If needed, make the hook scripts executable (for example, on Linux or macOS): `chmod +x .githooks/*`

### Hooks included

- **Pre-commit**: runs `terraform fmt -recursive` to format all files upon each commit.