variable "aws_region" {
    description = "The AWS region to deploy resources in."
    type        = string
}
variable "app_name" {
    description = "The name of the webapp."
    type        = string
}
variable "vpc_id" {
    description = "The ID of the VPC where resources will be deployed."
    type        = string
}
variable "subnet_ids" {
    description = "A list of subnet IDs for the database subnet group."
    type        = list(string)
}
variable "db_username" {
    description = "The username for the database."
    type        = string
    default     = "admin_user"
}
variable "db_password" {
    description = "The password for the database."
    type        = string
    default     = "securepassword"
    sensitive = true
}