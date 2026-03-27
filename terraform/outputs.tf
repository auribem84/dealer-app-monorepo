

output "deployment_info" {
  value = "Infraestructura desplegada exitosamente en la región ${render_web_service.backend_api.region}"
}