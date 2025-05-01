
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "location" {
  description = "Azure location"
  default     = "eastus"
}

variable "acr_name" {
  description = "ACR name (must be globally unique)"
}






