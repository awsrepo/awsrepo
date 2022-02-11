# Variable Declarations

variable "env" {
    description = "Environment type"
    type        = string
    default     = "prod"
}

variable "region" {
    description = "AWS Region"
    type        = string
    default     = "us-east-1"
}