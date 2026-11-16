# 🚀 Release Notes — `v1.0.2` (Etapas 3 y 4: Puntos de Control y Línea de Tiempo)

* **Rama Git / Tag:** `release/v1.0.2`
* **Imagen Docker:** `release-1.0.2`

## ✨ Novedades Principales
1. **Puntos de Control Logísticos — Checkpoints (Etapa 3):**
   * Registro manual de puntos de control en ruta (`POST /api/v1/generators/{generator}/checkpoints`) con actualización sincronizada del estado operativo del generador.
   * Modal reactivo `GeneratorStatusModal.vue` para operadores logísticos.
2. **Bitácora Histórica y Línea de Tiempo (Etapa 4):**
   * Consulta por número de serial (`GET /api/v1/tracking/{serial_number}`).
   * Vista interactiva `/tracking` con ficha técnica del generador, fotografía ampliable y línea de tiempo cronológica inmutable con certificación de operador responsable.
3. **Portal de Autogestión de Clientes y Reportes (Etapa 5):**
   * `ClientDashboard.vue` con aislamiento estricto de generadores asociados al cliente autenticado.
   * Módulo `/reports` con filtros avanzados y exportación a CSV.
