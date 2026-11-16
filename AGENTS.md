# 🤖 Contexto e Instrucciones para Agentes y Modelos de IA — BaiFa Power Tracking

Este archivo define el contexto arquitectónico, las reglas de negocio y las restricciones técnicas obligatorias para cualquier modelo o agente de Inteligencia Artificial (Gemini / Antigravity, Claude Code, Cursor, GitHub Copilot, Codex) que opere sobre el proyecto **BaiFa Power Tracking**.

---

## 1. 🗺️ Mapa del Ecosistema (Estado Actual `release/v1.0.5`)

El workspace `baifa/` se divide en tres módulos limpios:

1. **`baifa-api/` (Backend RESTful API — Puerto `14001` | Base de Datos MySQL — Puerto `14002`):**
   * **Stack:** Laravel 12 + PHP 8.4-FPM + Nginx Alpine + MySQL 8.0 + Laravel Sanctum.
   * **Módulos Implementados:**
     * **Autenticación y Recuperación (`/api/v1/auth/*`):** Login, registro atómico de cliente + empresa fiscal (RIF), perfil `/me`, logout y recuperación de contraseña con cuentas demo protegidas.
     * **Usuarios (`/api/v1/users`):** CRUD exclusivo para `admin` con notificación por correo (`WelcomeUserCreatedMail`).
     * **Directorio Fiscal de Clientes (`/api/v1/clients`):** CRUD y activación/desactivación para personal interno (`admin`, `manager`, `employee`) con correo de bienvenida (`WelcomeClientMail`).
     * **Catálogo de Generadores (`/api/v1/generators`):** Inventario por serial único, carga de fotografía en `storage/app/public/generators`, métricas (`/summary`) y notificación de cambios (`GeneratorUpdatedMail`).
     * **Trazabilidad y Checkpoints (`/api/v1/tracking/{serial}` y `/api/v1/generators/{id}/checkpoints`):** Consulta pública híbrida estilo MRW (`PublicGeneratorResource` para invitados vs `GeneratorResource` para autenticados) y registro inmutable de avances en ruta con notificación (`GeneratorCheckpointMail`).

2. **`baifa-ui/` (Frontend Web App — Puerto `15001`):**
   * **Stack:** Nuxt 4 + Vue 3 (`<script setup lang="ts">`) + Vuetify 3 + Tailwind CSS (`preflight: false`).
   * **Vistas Principales (`app/pages/`):**
     * `index.vue`: Dashboard operativo (para staff) o Portal de Autogestión (`ClientDashboard.vue` para rol `client`).
     * `generators.vue`: Gestión de inventario de generadores, filtros por estado y modales de alta/edición/cambio de estado.
     * `clients.vue`: Directorio fiscal de empresas clientes con validación de RIF venezolano.
     * `tracking.vue`: Buscador de trazabilidad por serial (público estilo MRW para invitados y completo con registro de checkpoints para operadores).
     * `users.vue`: Administración de usuarios y roles (exclusivo `admin`).
     * `reports.vue`: Reportes operativos filtrables y exportación a CSV.
     * `login.vue`, `register.vue`, `forgot-password.vue`, `reset-password.vue`: Flujos de autenticación.

3. **`baifa-docs/` (Repositorio Central de Documentación y Activos):**
   * Contiene las normas técnicas (`NORMAS_TECNICAS.md`), reglas de negocio (`business/`), guías de despliegue (`deploy/`), especificación OpenAPI (`api-spec/openapi.yaml`), notas de versión (`releases/`), informes (`informes/`) y capturas de referencia (`prototypes-and-screenshots/`).

---

## 2. 🔒 Reglas Estrictas de Desarrollo para Agentes de IA

1. **Puertos Estándar Locales:**
   * Backend API: **`14001`** (`http://localhost:14001/api`)
   * Base de Datos MySQL: **`14002`** (`127.0.0.1:14002` -> `3306` interno)
   * Frontend UI: **`15001`** (`http://localhost:15001`)
2. **Ejecución en Contenedores:**
   * Ejecutar siempre comandos de backend dentro del contenedor: `docker compose exec app <comando>`.
   * No ejecutar tests ni linters automáticamente a menos que el usuario lo solicite explícitamente.
3. **Arquitectura Limpia:**
   * En `baifa-api`: validar siempre mediante `FormRequest`, usar controladores delgados y retornar `JsonResource`.
   * En `baifa-ui`: usar `<script setup lang="ts">`, mantener `corePlugins: { preflight: false }` en Tailwind y respetar la paleta oscura corporativa (`#0b1120`, `#0f172a`, `#3eb134`, `#f97316`).
4. **Higiene del Workspace:**
   * No recrear carpetas temporales de empaquetado como `baifa-builds/` ni duplicar archivos de despliegue fuera de `baifa-docs/deploy/`.
5. **Flujo Git y Docker:**
   * Ramas de release en Git/GitHub: `release/vX.Y.Z` (actual: `release/v1.0.5`).
   * Tags en Docker Hub: `release-X.Y.Z` (`juaneliezer13/baifa-api:release-1.0.5` y `juaneliezer13/baifa-ui:release-1.0.5`).
