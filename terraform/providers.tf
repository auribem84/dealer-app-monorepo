terraform {
  # CONFIGURACIÓN DE TERRAFORM CLOUD
  cloud {
    organization = "auribem84_org" # <--- Cambia esto

    workspaces {
      name = "car-app" # <--- Cambia esto
    }
  }

  required_providers {
    render = {
      source  = "render-oss/render"
      version = "~> 1.0"
    }
  }
}

provider "render" {
  api_key  = var.render_api_key
  owner_id = var.render_owner_id
}