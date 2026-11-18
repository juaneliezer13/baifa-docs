# 🤖 CLAUDE.md — Contexto Técnico para Claude Code (BaiFa Power Tracking)

Este proyecto se rige obligatoriamente por las directrices detalladas en [`AGENTS.md`](./AGENTS.md) y [`NORMAS_TECNICAS.md`](./NORMAS_TECNICAS.md).

## Resumen Operativo (`release/v1.0.7`)

- **Workspace (`baifa/`) — 3 Repositorios Independientes:**
  - `baifa-api/` (`git@github.com:juaneliezer13/baifa-api.git`): API RESTful en Laravel 12 + PHP 8.4-FPM + Nginx Alpine (Puerto Host **`14001`**) + MySQL 8.0 (Puerto Host **`14002`**).
  - `baifa-ui/` (`git@github.com:juaneliezer13/baifa-ui.git`): Aplicación web en Nuxt 4 + Vue 3 + Vuetify 3 + Tailwind CSS (Puerto Host **`15001`**).
  - `baifa-docs/` (`git@github.com:juaneliezer13/baifa-docs.git`): Repositorio central de documentación, normas técnicas (`NORMAS_TECNICAS.md`), especificación OpenAPI 3.1 (`api-spec/openapi.yaml`), reglas de negocio (`business/`), guías DevOps (`deploy/`) y notas de versión (`releases/`).
- **Reglas Técnicas Inquebrantables:**
  1. Todo comando de PHP/Artisan/Composer se ejecuta en Docker: `docker compose exec app <comando>`.
  2. **PROHIBIDO** ejecutar tests (`php artisan test`, `npm test`) ni linters (`pint`, `eslint`) automáticamente salvo instrucción expresa.
  3. Validar entradas con `FormRequest` (backend) y `app/utils/validators.ts` (frontend: RIF, Cédula, Teléfono, Email, Seriales, Fotos), transformar salidas con `JsonResource` y mantener `openapi.yaml` en español.
  4. **Cero Data Dummy:** Prohibido introducir datos de demostración o accesos rápidos en producción.
  5. **Estándar de Releases:** Ramas **y** tags en GitHub usan siempre `release/vX.Y.Z` (ej. `release/v1.0.7`). Imágenes en Docker Hub usan `release-X.Y.Z` (ej. `release-1.0.7`).
