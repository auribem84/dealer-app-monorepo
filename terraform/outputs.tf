output "backend_url" {
  value       = render_web_service.backend_api.url
  description = "URL pública de tu servicio en Render"
}

output "database_host" {
  value       = render_postgres.db_backend.host
  description = "Host de la base de datos (para uso interno)"
}

output "deployment_info" {
  value = "Infraestructura desplegada exitosamente en la región ${render_web_service.backend_api.region}"
}