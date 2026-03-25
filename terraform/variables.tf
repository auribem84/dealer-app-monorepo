# No necesitas asignarles un 'default' aquí, 
# Terraform Cloud las llenará por ti al ejecutar el plan.

variable "render_api_key" {
  type      = string
  sensitive = true
}

variable "render_owner_id" {
  type      = string
}

variable "repo_url" {
  type        = string
  default     = "https://github.com/auribem84/dealer-app-monorepo"
}
}