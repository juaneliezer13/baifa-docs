# 🚀 Release Notes — `v1.0.4` (Consolidación de Enlaces en Correos y OpenAPI)

* **Rama Git / Tag:** `release/v1.0.4`
* **Imagen Docker:** `release-1.0.4`

## ✨ Novedades Principales
1. **Resolución de URLs en Correos Transaccionales:**
   * Todos los enlaces de seguimiento y acceso en correos electrónicos apuntan a `config('app.frontend_url')` con parámetro `?serial=<SERIAL>` para abrir automáticamente el rastreo del equipo en el portal frontend.
2. **Actualización Integral de OpenAPI (`openapi.yaml`):**
   * Documentación completa de los endpoints de rastreo público/autenticado y esquemas `PublicGeneratorResource`.
