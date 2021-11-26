variable "region" {
  type        = string
  default     = "us-west-1"
  description = "Place where VPN will be deployed"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance type for server"
}

variable "access_key" {
  type        = string
  description = "Cloud access key"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "Cloud secret key"
  sensitive   = true
}

variable "virtual_machine_host_name" {
  type        = string
  description = "Name of virtual machine instance in cloud"
  default     = "PPTP VPN Host"
}

variable "vpn_client_name" {
  type        = string
  description = "Login name of VPN user"
}

variable "vpn_client_password" {
  type        = string
  description = "Password of VPN user"
  sensitive   = true
}

