# 🤖 GEMINI.md — Contexto para Gemini / Antigravity (BaiFa Power Tracking)

Este proyecto sigue las especificaciones detalladas en [`AGENTS.md`](./AGENTS.md) y [`NORMAS_TECNICAS.md`](./NORMAS_TECNICAS.md).

## Puntos Críticos a Recordar (`release/v1.0.5`)

1. **Estructura Limpia del Workspace (`baifa/`):**
   * `baifa.code-workspace` y `.vscode/settings.json`: Configuración del workspace con la paleta corporativa de BaiFa Power (`#0b1120`, `#0f172a`, `#3eb134`, `#f97316`).
   * `baifa-api/`: Backend RESTful en Laravel 12 + PHP 8.4-FPM + Nginx (Puerto **`14001`**) y MySQL 8.0 (Puerto **`14002`**).
   * `baifa-ui/`: Frontend en Nuxt 4 + Vue 3 + Vuetify 3 + Tailwind CSS (Puerto **`15001`**).
   * `baifa-docs/`: Repositorio central de documentación, reglas de negocio, OpenAPI, releases, informes y despliegue.
   * La carpeta temporal `baifa-builds/` y los scripts/HTML intermedios de generación de PDFs fueron eliminados por estandarización.

2. **Estado Funcional (`release/v1.0.5`):**
   * Etapas 1 a 5 operativas: Autenticación Sanctum y Roles (`admin`, `manager`, `employee`, `client`), Directorio Fiscal de Clientes, Catálogo de Generadores con fotos, Trazabilidad con Checkpoints manuales, Consulta Pública estilo MRW para invitados (`/tracking`), Notificaciones por correo y Reportes con exportación CSV.
