# 1. BASE DE DATOS POSTGRESQL
resource "render_postgres" "db_backend" {
  name     = "sre-postgres-db"
  plan     = "free"
  region   = "oregon"
  version  = "15"

  user          = "admin_user"
  database_name = "app_db"
}

# 2. SERVICIO WEB (BACKEND)
resource "render_web_service" "backend_api" {
  name    = "sre-backend-service"
  plan    = "free"
  region  = "oregon"
  
  runtime_source = {
    native_runtime = {
      auto_deploy   = true
      branch        = "main"
      build_command = "pip install -r requirements.txt" # Ajusta según tu lenguaje
      start_command = "uvicorn main:app --host 0.0.0.0 --port $PORT"
      repo_url      = var.repo_url
      runtime       = "python"
    }
  }

  env_vars = {
    # CONEXIÓN DINÁMICA: Terraform construye la URL usando los datos de la DB creada arriba
    "DATABASE_URL" = {
      value = "postgresql://${render_postgres.db_backend.user}:${render_postgres.db_backend.password}@${render_postgres.db_backend.host}/${render_postgres.db_backend.database_name}"
    }
    "NODE_ENV" = {
      value = "production"
    }
  }
}