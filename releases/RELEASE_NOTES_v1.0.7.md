# 🚀 Release Notes — `v1.0.7` (Eliminación de Data Dummy y Validaciones Integrales de Formularios)

* **Rama Git / Tag GitHub:** `release/v1.0.7`
* **Imagen Docker:** `release-1.0.7`

## ✨ Novedades Principales
1. **Eliminación Total de Data Dummy para Producción:**
   * En `baifa-ui`: Removidos los botones y credenciales de prueba rápida en `/login`, enlaces de demostración en `/forgot-password`, mocks en `RestAuthAdapter.ts`, contadores ficticios y listas estáticas en el Dashboard administrativo (`index.vue`), Portal de Clientes (`ClientDashboard.vue`) y chips de ejemplo en `/tracking`.
   * En `baifa-api`: Eliminados `ClientSeeder.php`, `GeneratorSeeder.php` y `CheckpointSeeder.php`, dejando en `DatabaseSeeder.php` únicamente la cuenta inicial de Superadministrador (`admin@baifa.com.ve`).
2. **Validaciones y Auto-Formateo en Todos los Formularios (`validators.ts` + `FormRequests`):**
   * **RIF y Cédula Venezolana:** Auto-formateo y validación de RIF (`J-12345678-9`, `G-...`, `V-...-0`) y Cédula de Identidad (`V-12345678`, `E-81234567`).
   * **Teléfonos:** Auto-formateo nacional (`0414-1234567`, `0212-5551234`) y soporte internacional (`+58 414-1234567`).
   * **Correo Electrónico:** Validación estricta de estructura, dominio y TLD en todos los formularios de autenticación, clientes y usuarios.
   * **Generadores y Puntos de Control:** Validación y auto-formateo de seriales (`GEN-2026-0041`), capacidad en kVA (`> 0`), nombres de puntos de control y validación inmediata de fotografías (`JPEG, PNG, WebP` hasta `5 MB`).
