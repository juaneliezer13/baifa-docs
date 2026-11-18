# 🤖 Contexto e Instrucciones para Agentes y Modelos de IA — BaiFa Power Tracking

Este archivo define el contexto arquitectónico, las reglas de negocio y las restricciones técnicas obligatorias para cualquier modelo o agente de Inteligencia Artificial (Gemini / Antigravity, Claude Code, Cursor, GitHub Copilot, Codex) que opere sobre el proyecto **BaiFa Power Tracking**.

---

## 1. 🗺️ Mapa del Ecosistema (Estado Actual `release/v1.0.7`)

El workspace `baifa/` se divide en tres repositorios independientes:

1. **`baifa-api/` (Backend RESTful API — Puerto `14001` | Base de Datos MySQL — Puerto `14002`):**
   * **Repositorio:** `git@github.com:juaneliezer13/baifa-api.git`
   * **Stack:** Laravel 12 + PHP 8.4-FPM + Nginx Alpine + MySQL 8.0 + Laravel Sanctum.
   * **Módulos Implementados:**
     * **Autenticación y Recuperación (`/api/v1/auth/*`):** Login, registro atómico de cliente + empresa fiscal (RIF), perfil `/me`, logout y recuperación de contraseña.
     * **Usuarios (`/api/v1/users`):** CRUD exclusivo para `admin` con validación de Cédula/Teléfono/Email y notificación por correo (`WelcomeUserCreatedMail`).
     * **Directorio Fiscal de Clientes (`/api/v1/clients`):** CRUD y activación/desactivación para personal interno (`admin`, `manager`, `employee`) con validación estricta de RIF venezolano y correo de bienvenida (`WelcomeClientMail`).
     * **Catálogo de Generadores (`/api/v1/generators`):** Inventario por serial único, carga de fotografía en `storage/app/public/generators`, métricas (`/summary`) y notificación de cambios (`GeneratorUpdatedMail`).
     * **Trazabilidad y Checkpoints (`/api/v1/tracking/{serial}` y `/api/v1/generators/{id}/checkpoints`):** Consulta pública híbrida estilo MRW (`PublicGeneratorResource` para invitados vs `GeneratorResource` para autenticados) y registro inmutable de avances en ruta con notificación (`GeneratorCheckpointMail`).

2. **`baifa-ui/` (Frontend Web App — Puerto `15001`):**
   * **Repositorio:** `git@github.com:juaneliezer13/baifa-ui.git`
   * **Stack:** Nuxt 4 + Vue 3 (`<script setup lang="ts">`) + Vuetify 3 + Tailwind CSS (`preflight: false`).
   * **Utilidades de Validación:** `app/utils/validators.ts` (auto-formateo y reglas para RIF, Cédula, Teléfono, Correo, Seriales, kVA, Nombres y Fotografías en todos los formularios).
   * **Vistas Principales (`app/pages/`):** `index.vue`, `generators.vue`, `clients.vue`, `tracking.vue`, `users.vue`, `reports.vue`, `login.vue`, `register.vue`, `forgot-password.vue`, `reset-password.vue`.

3. **`baifa-docs/` (Repositorio Independiente de Documentación y Activos):**
   * **Repositorio:** `git@github.com:juaneliezer13/baifa-docs.git`
   * Contiene las normas técnicas (`NORMAS_TECNICAS.md`), reglas de negocio (`business/`), guías de despliegue (`deploy/`), especificación OpenAPI (`api-spec/openapi.yaml`), notas de versión (`releases/`), informes (`informes/`) y capturas de referencia (`prototypes-and-screenshots/`).

---

## 2. 🔒 Reglas Estrictas de Desarrollo para Agentes de IA (Cumplimiento Obligatorio)

1. **Puertos Estándar Locales:**
   * Backend API (`baifa-api`): **`14001`** (`http://localhost:14001/api`)
   * Base de Datos MySQL (`baifa_api_db`): **`14002`** (`127.0.0.1:14002` -> `3306` interno)
   * Frontend UI (`baifa-ui`): **`15001`** (`http://localhost:15001`)
2. **Ejecución en Contenedores:**
   * Ejecutar siempre comandos de backend dentro del contenedor: `docker compose exec app <comando>`.
   * **PROHIBIDO** ejecutar tests (`php artisan test`, `npm test`) ni linters (`pint`, `eslint`) automáticamente a menos que el usuario lo solicite explícitamente.
3. **Arquitectura Limpia y Validaciones:**
   * En `baifa-api`: validar siempre mediante `FormRequest` en español, usar controladores delgados y retornar `JsonResource`.
   * En `baifa-ui`: usar `<script setup lang="ts">`, validar formularios con `app/utils/validators.ts`, mantener `corePlugins: { preflight: false }` en Tailwind y respetar la paleta oscura corporativa (`#0b1120`, `#0f172a`, `#3eb134`, `#f97316`).
   * **Cero Data Dummy:** No agregar datos ficticios, mocks ni botones de acceso rápido de prueba en el código de producción.
4. **Higiene del Workspace:**
   * No recrear carpetas temporales de empaquetado como `baifa-builds/` ni duplicar archivos de despliegue fuera de `baifa-docs/deploy/`.
5. **Flujo Git, GitHub Tags y Docker Hub:**
   * **Ramas y Tags de Release en Git/GitHub:** `release/vX.Y.Z` (ej. `release/v1.0.7`). **NUNCA** crear tags sin el prefijo `release/` (usar `refs/heads/release/vX.Y.Z` y `refs/tags/release/vX.Y.Z`).
   * **Tags en Docker Hub:** `release-X.Y.Z` (`juaneliezer13/baifa-api:release-1.0.7` y `juaneliezer13/baifa-ui:release-1.0.7`).
