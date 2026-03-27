# No necesitas asignarles un 'default' aquí, 
# Terraform Cloud las llenará por ti al ejecutar el plan.

variable "RENDER_API_KEY" {
  type      = string
  sensitive = true
  default   = "rnd_5pytohBuTRMIbxyKpTo9zcXK7M2R"
}

variable "RENDER_OWNER_ID" {
  type      = string
  default   = "usr-d6tjt6q4d50c73cc912g"
}

variable "repo_url" {
  type        = string
  default     = "https://github.com/auribem84/dealer-app-monorepo"
}