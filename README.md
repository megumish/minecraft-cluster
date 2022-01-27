# Kubernetes Bootstrap

This repository is a bootstrap template for creating a Kubernetes cluster.

# Support Environment

## Cloud Provider
- Linode

# Usage

Use one of the following methods.
- Deploy on CLI using terraform command
- Deploy on Terraform Cloud

## Deploy on CLI using terraform command

### Preparing

Install the following command.
terraform (version 1.1.2 later)

Also, make sure to have the credential information of the cloud provider.

For the following tasks, work in the terraform directory.

### 1. Fill in the terraform variables

Create terraform.auto.tfvars or, copy terraform.auto.tfvars.example and rename this to terraform.auto.tfvars.

Then, fill in the terraform variables. See the [Terraform Variable List](#terraform-variables-list)

### 2. Terraform init and plan, apply

Once you have completed the above steps, you can use the terraform init and apply commands to complete the process.

If you want to check the result of terraform plan, use terraform plan after terraform init.

## Deploy on Terraform Cloud

### Preparing

Install the following command.
terraform (version 1.1.2 later)

Also, make sure to have the credential information of the cloud provider.

For the following tasks, work in the terraform directory.

### 1. Fill in the terraform variables

Create terraform.auto.tfvars or, copy terraform.auto.tfvars.example and rename this to terraform.auto.tfvars.

Then, fill in the terraform variables. 

### 2. Terraform init and plan, apply

Once you have completed the above steps, you can use the terraform init and apply commands to complete the process.

If you want to check the result of terraform plan, use terraform plan after terraform init.

## Deploy on Terraform Cloud

Refer to the [tutorial](https://learn.hashicorp.com/collections/terraform/cloud-get-started) on the Terraform Cloud website.

Also, for Workspace Variables, see the [Terraform Variable List](#terraform-variables-list).

# Terraform Variables List

|Name|Type|Description|
|----|----|-----------|
|environment|string|(optional)This value is intended to divide the data by environment, such as Development, Staging, Production. |
|linode_token|string|(optional) linode token|

# LICENSE

MIT