# 🤖 CLAUDE.md — Contexto Técnico para Claude Code (BaiFa Power Tracking)

Este proyecto se rige por las directrices detalladas en [`AGENTS.md`](./AGENTS.md) y [`NORMAS_TECNICAS.md`](./NORMAS_TECNICAS.md).

## Resumen Operativo (`release/v1.0.5`)

- **Workspace (`baifa/`):**
  - `baifa-api/`: API RESTful en Laravel 12 + PHP 8.4-FPM + Nginx Alpine (Puerto Host `14001`) + MySQL 8.0 (Puerto Host `14002`).
  - `baifa-ui/`: Aplicación web en Nuxt 4 + Vue 3 + Vuetify 3 + Tailwind CSS (Puerto Host `15001`).
  - `baifa-docs/`: Documentación centralizada, especificación OpenAPI 3.1 (`api-spec/openapi.yaml`), reglas de negocio (`business/`), guías DevOps (`deploy/`) y notas de versión (`releases/`).
- **Reglas Clave:**
  1. Todo comando de PHP/Artisan/Composer se ejecuta en Docker: `docker compose exec app <comando>`.
  2. No ejecutar tests (`php artisan test`) ni linters (`pint`, `eslint`) automáticamente salvo instrucción expresa.
  3. Validar entradas con `FormRequest`, transformar salidas con `JsonResource` y mantener `openapi.yaml` en español.
  4. En el frontend, mantener `preflight: false` en Tailwind CSS para convivir con Vuetify 3 y usar `<script setup lang="ts">`.
