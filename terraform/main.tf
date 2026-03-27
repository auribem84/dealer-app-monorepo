resource "render_web_service" "backend_api" {
  name   = "sre-backend-service"
  plan   = "free"
  region = "oregon"

  runtime_source = {
    type          = "native"                    # must be "native"
    repo          = var.repo_url
    branch        = "main"
    runtime       = "python"
    build_command = "pip install -r requirements.txt"
    start_command = "uvicorn main:app --host 0.0.0.0 --port $PORT"
    auto_deploy   = true
  }

  env_vars = {
    NODE_ENV = {
      value = "production"
    }
  }
}
