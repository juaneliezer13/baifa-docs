# 🚀 Release Notes — `v1.0.3` (Notificaciones Transaccionales y Rastreo Público)

* **Rama Git / Tag:** `release/v1.0.3`
* **Imagen Docker:** `release-1.0.3`

## ✨ Novedades Principales
1. **Sistema de Notificaciones por Correo Electrónico:**
   * Plantillas corporativas HTML para bienvenida de clientes (`WelcomeClientMail`), creación de usuarios (`WelcomeUserCreatedMail`), actualización de generador (`GeneratorUpdatedMail`) y nuevos puntos de control (`GeneratorCheckpointMail`).
2. **Rastreo Público para Invitados (Estilo MRW):**
   * Soporte para acceso sin sesión a `/tracking` y `/tracking/:serial` mediante `PublicGeneratorResource` y `PublicCheckpointResource`, protegiendo datos fiscales sensibles del cliente.
3. **Estándar de Versionado:**
   * Definición formal del estándar `release/vX.Y.Z` para ramas/tags de GitHub y `release-X.Y.Z` para imágenes en Docker Hub.
