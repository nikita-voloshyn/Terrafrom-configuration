variable "server_name_root" {
    description = "The name of the core project."
    type        = string
    default = "CORE"
}
variable "aws_region" {
    description = "The AWS region to deploy resources in."
    type        = string
    default     = "eu-central-1"
}