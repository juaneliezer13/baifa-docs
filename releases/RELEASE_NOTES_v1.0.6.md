# 🚀 Release Notes — `v1.0.6` (Estandarización de Puertos Locales, Limpieza de Proyecto y Workspace)

* **Rama Git / Tag:** `release/v1.0.6` / `v1.0.6`
* **Imagen Docker:** `release-1.0.6`

## ✨ Novedades Principales
1. **Estandarización de Puertos en Entorno Local:**
   * **Backend API (`baifa-api`):** Puerto **`14001`** (`http://localhost:14001/api`)
   * **Base de Datos MySQL (`baifa_api_db`):** Puerto **`14002`** (`127.0.0.1:14002` -> `3306` interno)
   * **Frontend Web (`baifa-ui`):** Puerto **`15001`** (`http://localhost:15001`)
2. **Limpieza Integral de Backend y Frontend:**
   * En `baifa-api`: Eliminación de archivos residuales y no utilizados (`.htaccess` raíz, `.env.production.example`, `public/storage-link-helper.php`, `docs/deploy/` duplicado y boilerplate de Vite/CSS/JS).
   * En `baifa-ui`: Conversión de `Dockerfile` a construcción multietapa autónoma con `node:22-alpine` y eliminación de `public/.htaccess` residual.
3. **Configuración de Workspace y Documentación Centralizada (`baifa-docs`):**
   * Incorporación de `baifa.code-workspace` y `.vscode/settings.json` con la paleta corporativa de BaiFa Power.
   * Estandarización de `baifa-docs` con `NORMAS_TECNICAS.md`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, directorio `releases/` y limpieza de scripts temporales en `informes/`.
