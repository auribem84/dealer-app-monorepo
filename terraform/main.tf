# 1. BASE DE DATOS POSTGRESQL
resource "render_postgres" "db_backend" {
  name          = "sre-postgres-db"
  plan          = "free"
  region        = "oregon"
  version       = "15"
  database_name = var.db_name       # Now uses variable
  password      = var.db_password   # Must define a password
}

# 2. SERVICIO WEB (BACKEND)
resource "render_web_service" "backend_api" {
  name   = "sre-backend-service"
  plan   = "free"
  region = "oregon"

  runtime_source = {
    native_runtime = {
      auto_deploy   = true
      branch        = "main"
      build_command = "pip install -r requirements.txt"
      start_command = "uvicorn main:app --host 0.0.0.0 --port $PORT"
      repo_url      = var.repo_url
      runtime       = "python"
    }
  }

  env_vars = {
    "DATABASE_URL" = {
      value = "postgresql://${var.db_username}:${var.db_password}@${var.db_host}/${var.db_name}"
    }
    "NODE_ENV" = {
      value = "production"
    }
  }
}

# 3. VARIABLES
variable "db_name" {
  type    = string
  default = "app_db"
}

variable "db_username" {
  type    = string
  default = "postgres"   # Render default user
}

variable "db_password" {
  type      = string
  sensitive = true
  default   = "supersecretpassword" # Replace with your password or use TF Cloud secret
}

variable "db_host" {
  type    = string
  default = "sre-postgres-db.render.com" # Replace with your Render DB host
}
