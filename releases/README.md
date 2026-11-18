# 🏷️ Historial Centralizado de Versiones y Release Notes — BaiFa Power Tracking

Este directorio centraliza todas las notas de versión (*Release Notes*) y el control de versiones del ecosistema **BaiFa Power Tracking** (`baifa-ui` Frontend Web y `baifa-api` Backend RESTful API).

---

## 📊 Matriz de Versiones del Ecosistema

| Versión | Tag / Rama GitHub | Fecha / Hito Principal | Imagen Docker | Archivo de Notas |
| :--- | :--- | :--- | :--- | :--- |
| **`v1.0.7`** *(Actual)* | `release/v1.0.7` | Eliminación de data dummy para producción y validaciones integrales con auto-formateo (RIF, Cédula, Teléfono, Correo, Seriales y Fotos) en todos los formularios | `juaneliezer13/baifa-api:release-1.0.7`<br>`juaneliezer13/baifa-ui:release-1.0.7` | [`RELEASE_NOTES_v1.0.7.md`](./RELEASE_NOTES_v1.0.7.md) |
| **`v1.0.6`** | `release/v1.0.6` | Estandarización de puertos locales (`14001` API / `15001` UI / `14002` DB), limpieza de archivos no utilizados, Dockerfile multietapa y workspace `.code-workspace` | `juaneliezer13/baifa-api:release-1.0.6`<br>`juaneliezer13/baifa-ui:release-1.0.6` | [`RELEASE_NOTES_v1.0.6.md`](./RELEASE_NOTES_v1.0.6.md) |
| **`v1.0.5`** | `release/v1.0.5` | Resolución de API Base en producción (`https://baifa-api.batdev.lat/api`) y actualización de guías EC2 | `juaneliezer13/baifa-api:release-1.0.5`<br>`juaneliezer13/baifa-ui:release-1.0.5` | [`RELEASE_NOTES_v1.0.5.md`](./RELEASE_NOTES_v1.0.5.md) |
| **`v1.0.4`** | `release/v1.0.4` | Corrección de URLs en correos de notificación hacia el portal frontend y soporte de dominios | `juaneliezer13/baifa-api:release-1.0.4`<br>`juaneliezer13/baifa-ui:release-1.0.4` | [`RELEASE_NOTES_v1.0.4.md`](./RELEASE_NOTES_v1.0.4.md) |
| **`v1.0.3`** | `release/v1.0.3` | Notificaciones automáticas por correo electrónico y vista de rastreo público para invitados | `juaneliezer13/baifa-api:release-1.0.3`<br>`juaneliezer13/baifa-ui:release-1.0.3` | [`RELEASE_NOTES_v1.0.3.md`](./RELEASE_NOTES_v1.0.3.md) |
| **`v1.0.2`** | `release/v1.0.2` | Etapas 3 y 4: Puntos de control (*Checkpoints*), bitácora inmutable y línea de tiempo (*Timeline*) | `juaneliezer13/baifa-api:release-1.0.2`<br>`juaneliezer13/baifa-ui:release-1.0.2` | [`RELEASE_NOTES_v1.0.2.md`](./RELEASE_NOTES_v1.0.2.md) |
| **`v1.0.1`** | `release/v1.0.1` | Etapas 1 y 2: Autenticación Sanctum, Roles RBAC, Directorio Fiscal de Clientes y Catálogo de Generadores | `juaneliezer13/baifa-api:release-1.0.1`<br>`juaneliezer13/baifa-ui:release-1.0.1` | [`RELEASE_NOTES_v1.0.1.md`](./RELEASE_NOTES_v1.0.1.md) |
