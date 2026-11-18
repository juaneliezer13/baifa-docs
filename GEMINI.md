# 🤖 GEMINI.md — Contexto y Reglas Técnicas para Gemini / Antigravity (BaiFa Power Tracking)

Este proyecto sigue obligatoriamente las especificaciones detalladas en [`AGENTS.md`](./AGENTS.md) y [`NORMAS_TECNICAS.md`](./NORMAS_TECNICAS.md).

## Reglas Técnicas Obligatorias para Todas las Tareas (`release/v1.0.7`)

1. **Estructura de Repositorios en el Workspace (`baifa/`):**
   * `baifa-api/` (`git@github.com:juaneliezer13/baifa-api.git`): Backend RESTful en Laravel 12 + PHP 8.4-FPM + Nginx (Puerto **`14001`**) y MySQL 8.0 (Puerto **`14002`**).
   * `baifa-ui/` (`git@github.com:juaneliezer13/baifa-ui.git`): Frontend en Nuxt 4 + Vue 3 + Vuetify 3 + Tailwind CSS (Puerto **`15001`**).
   * `baifa-docs/` (`git@github.com:juaneliezer13/baifa-docs.git`): Repositorio independiente de documentación técnica, reglas de negocio, OpenAPI, releases, informes y despliegue.
2. **Estándar de Releases y Tags (GitHub vs Docker Hub):**
   * **GitHub (Ramas y Tags):** Formato obligatorio **`release/vX.Y.Z`** (ej. `release/v1.0.7`). **Nunca** usar tags `vX.Y.Z` sin el prefijo `release/`. Emplear siempre `refs/heads/release/vX.Y.Z` y `refs/tags/release/vX.Y.Z` en comandos Git.
   * **Docker Hub:** Formato **`release-X.Y.Z`** (`juaneliezer13/baifa-api:release-1.0.7`, `juaneliezer13/baifa-ui:release-1.0.7`).
3. **Ejecución y Calidad de Código:**
   * Ejecutar comandos PHP/Artisan/Composer dentro de Docker (`docker compose exec app <comando>`).
   * **PROHIBIDO** ejecutar `php artisan test`, `./vendor/bin/pint`, `npm test` o `eslint` automáticamente salvo petición expresa del usuario.
   * Mantener **cero data dummy** en el código y usar las validaciones de `app/utils/validators.ts` (frontend) y `FormRequest` (backend) en todos los formularios.
