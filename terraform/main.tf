
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
