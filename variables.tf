variable "region" {}
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "ssh_key_name" {}
variable "db_subnet_ids" {
  type = list(string)
}
