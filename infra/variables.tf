
variable "project_name" {
  description = "The project name prefix for resource tagging and naming."
  type        = string
  default     = "spender-guardian"
}

variable "db_password" {
  description = "The PostgreSQL database master password."
  type        = string
  sensitive   = true
}