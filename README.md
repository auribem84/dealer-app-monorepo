# dealer-app-monorepo
MonoRepo for dealer management app. 

mi-proyecto/
├── .github/workflows/   # CI/CD para App e Infra
├── terraform/           # Todo lo de Render (DB, Web Service, Slack)
├── backend/             # Código Python/Node
├── frontend/            # Código React/Vue/Static
└── README.md


Terraform Cloud: Guardar el estado (el archivo .tfstate) de forma segura en la nube.
├── Organization: auribe84m_org
├── Workspace: car-app



├── .github/workflows/terraform.yml
├── src/                # Tu código de Python/Node para Render
└── terraform/
    ├── main.tf         # Definición de Web Service y Postgres
    ├── providers.tf    # Configuración del provider de Render
    ├── variables.tf    # Definición de variables
    └── outputs.tf      # URL final del servicio y host de DB