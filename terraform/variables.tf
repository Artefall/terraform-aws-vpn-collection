variable "aws_region" {
    type = string
    description = ""
}

variable "aws_key" {
    type = string
    sensitive = true
    description = "AWS Key"
}

variable "secret_key" {
    type = string
    sensitive = true
    description = "AWS Secret key" 
}

variable "instance_type" {
    type = string
    description = "Instance type for server" 
}
