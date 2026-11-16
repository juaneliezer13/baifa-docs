# 🚀 Release Notes — `v1.0.1` (Etapas 1 y 2: Identidades, Clientes y Catálogo de Generadores)

* **Rama Git / Tag:** `release/v1.0.1`
* **Imagen Docker:** `release-1.0.1`

## ✨ Novedades Principales
1. **Autenticación y Control de Roles (Etapa 1.1):**
   * Inicio de sesión, cierre de sesión, perfil `/me` y recuperación de contraseña con Laravel Sanctum.
   * Roles del sistema: `admin`, `manager`, `employee` y `client`.
   * Módulo de administración de usuarios del sistema (`/users`).
2. **Directorio Fiscal de Clientes (Etapa 1.2):**
   * Registro atómico de cuenta de cliente junto con su ficha fiscal empresarial (Razón Social, Nombre Corto, RIF venezolano y datos de contacto).
   * CRUD completo y activación/inactivación de empresas clientes (`/clients`).
3. **Catálogo e Inventario de Generadores Eléctricos (Etapa 2):**
   * Gestión de generadores por número de serial único, modelo, capacidad en kVA, cliente asignado, ETA y carga de fotografía referencial (`/generators`).
   * Indicadores visuales para los 5 estados logísticos (`warehouse`, `in_transit`, `checkpoint`, `delivered`, `installed`).
