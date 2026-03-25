# No necesitas asignarles un 'default' aquí, 
# Terraform Cloud las llenará por ti al ejecutar el plan.

variable "RENDER_API_KEY" {
  type      = string
  sensitive = true
}

variable "RENDER_OWNER_ID" {
  type      = string
}

variable "repo_url" {
  type        = string
  default     = "https://github.com/auribem84/dealer-app-monorepo"
}