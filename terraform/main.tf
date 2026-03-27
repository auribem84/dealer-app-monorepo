resource "render_web_service" "backend_api" {
  name     = "sre-backend-service"
  plan     = "free"
  region   = "oregon"
  repo_url = var.repo_url

  runtime_source {
    native_runtime {
      runtime       = "python"                           # required
      branch        = "main"                             # required
      auto_deploy   = true                               # optional but common
      build_command = "pip install -r requirements.txt" # your build command
      start_command = "uvicorn main:app --host 0.0.0.0 --port $PORT" # required
    }
  }

  env_vars = {
    "NODE_ENV" = "production"
  }
}