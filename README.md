# AKS Infrastructure with Terraform

This repository contains the Terraform configuration used to provision Azure infrastructure for running the **Online shop** application on an Azure Kubernetes Service (AKS) cluster.

##  Infrastructure Overview

The following Azure resources are provisioned:

- **Resource Group**
- **Virtual Network** with a subnet for AKS
- **Azure Kubernetes Service (AKS)** cluster with system-assigned managed identity
- **Log Analytics Workspace** for monitoring and diagnostics

## Repository Structure
```bash
├── main.tf # AKS cluster, VNet, monitoring
├── variables.tf # Input variables
├── outputs.tf # Output values
├── terraform.tfvars # Variable values (not committed to version control)
└── README.md # This file with documentation
```


##  Getting Started

### 1. Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure subscription with sufficient privileges

### 2. Authenticate with Azure

```bash
az login
az account set --subscription "<your-subscription-name-or-id>"
```
### 3. Configure Variables
You can provide required variables in one of the following ways:

🔹 Option 1: Use terraform.tfvars (Recommended for Local Dev)
Create a terraform.tfvars file and add:

```bash
subscription_id = "your-subscription-id"
client_id       = "your-client-id"
client_secret   = "your-client-secret"
tenant_id       = "your-tenant-id"
resource_group  = "your-resource-group-name"
location        = "East US"
```
⚠️ Sensitive Info Warning: Add terraform.tfvars to .gitignore to avoid leaking secrets.

🔹 Option 2: Manual Input during terraform apply
Omit terraform.tfvars, and Terraform will prompt for each variable interactively.

🔹 Option 3: Use Azure Key Vault (Recommended for Production)
You can securely fetch secrets from Azure Key Vault instead of hardcoding them.

### 4. Deployment 
1. Initialize Terraform
terraform init

2. Review and apply the configuration

```bash
terraform plan
terraform apply
```
Confirm with yes when prompted.

### 5.  Outputs
After apply, Terraform will output:
```bash
AKS cluster name
ACR login server
Kubernetes credentials
```
## Conclusions
This Terraform setup lays the foundation for a secure and scalable Azure Kubernetes environment. By managing infrastructure as code, you ensure consistency, repeatability, and easier collaboration across teams. As you continue to expand, consider integrating Key Vault, monitoring, network policies, and GitOps (e.g., Argo CD) for production-grade deployments.

