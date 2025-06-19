variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "il-central-1" 
}

variable "subnet_ids" {
  description = "List of existing private subnet IDs in the VPC"
  type        = list(string)
  default     = [
    "subnet-xxxxxxxxxxxxxxxx1",
    "subnet-xxxxxxxxxxxxxxxx2"
  ]
}

variable "security_group_id" {
  description = "ID of an existing security group"
  type        = string
  default     = "sg-xxxxxxxxxxxxxxxxx"
}

variable "key_name" {
  description = "Name of the existing SSH key pair (not the .pem filename)"
  type        = string
  default     = "imtec"
}

variable "service_name" {
  description = "Logical name for tagging resources"
  type        = string
  default     = "ofir"
}
