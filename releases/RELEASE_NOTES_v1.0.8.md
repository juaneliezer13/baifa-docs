# 🚀 Release Notes — `v1.0.8` (Etapa 5 Completada, 7 Estados Logísticos, Logotipo Oficial BaiFa®, Rol Empleado Limitado y Gestión de Perfil)

* **Rama Git / Tag GitHub:** `release/v1.0.8`
* **Imagen Docker:** `release-1.0.8` (`juaneliezer13/baifa-api:release-1.0.8` y `juaneliezer13/baifa-ui:release-1.0.8`)

## ✨ Novedades Principales

1. **Nuevos 7 Estados Logísticos del Generador (`GeneratorStatus`):**
   * Actualización integral en Backend, Base de Datos (migración `2026_11_18_150000_update_generator_statuses_to_seven_stages`), Frontend y correos transaccionales:
     1. `purchase_order` — **Orden de Compra**
     2. `in_production` — **En Producción**
     3. `origin_customs` — **En Aduana de Origen**
     4. `maritime_transit` — **En Tránsito Marítimo**
     5. `destination_customs` — **En Aduana Destino**
     6. `baifa_warehouse` — **En Almacén BaiFa**
     7. `delivered` — **Entregado**

2. **Integración del Logotipo Oficial de BaiFa® (Versiones Dark y Light):**
   * Incorporación de los logotipos originales de **BaiFa®** en alta definición con fondo transparente (`logo-baifa-green.png` y `logo-baifa-white.png`) en `AppLogo.vue`, `AppSidebar.vue`, `ClientHeader.vue`, vistas de autenticación y portal público de rastreo.

3. **Culminación de la Etapa 5 (Tablero de Reportes Ejecutivos y Portal de Clientes):**
   * **Backend (`GET /api/v1/reports/overview`):** Nuevo controlador `ReportController.php` con métricas porcentuales por estado logístico, resumen de clientes, resumen de usuarios y logs categorizados `[REPORTES_INFO]` / `[REPORTES_ERROR]`.
   * **Frontend (`/reports`):** Tablero ejecutivo con tarjetas de los 7 estados logísticos y `% del total`, pestañas de **Generadores** (en proceso vs. entregados), **Clientes** y **Usuarios**, filtros combinados y **Exportación CSV** compatible con Excel (UTF-8 BOM).
   * **Portal de Clientes (`ClientDashboard.vue`):** Buscador rápido de rastreo por serial integrado en el banner de bienvenida y barras de progreso porcentual de las 7 etapas logísticas por unidad.

4. **Rol de Empleado (`employee`) con Acceso Operativo Limitado:**
   * Restricción en API y Frontend: el perfil **Empleado** cuenta con acceso a `Dashboard`, `Rastrear`, `Generadores` (registro/edición y actualización de puntos de control sin permiso de eliminación), `Clientes` (modo solo lectura / consulta) y `Mi Perfil`. Sin acceso a `Usuarios` (`/users`) ni a `Reportes Ejecutivos` (`/reports`).

5. **Pantalla de Gestión de Perfil (`Mi Perfil` — `/profile`) para Todos los Roles:**
   * **Backend (`PUT / PATCH /api/v1/auth/profile`):** Endpoint validado mediante `UpdateProfileRequest` para actualizar nombre, correo electrónico, contraseña actual/nueva y, para cuentas de tipo **Cliente**, la ficha fiscal y teléfonos de su empresa asociada.
   * **Frontend (`/profile`):** Vista adaptativa para **Cliente**, **Empleado**, **Jefe / Gerente** y **Administrador** con resumen de permisos del rol, edición de datos personales/corporativos y cambio seguro de contraseña.
