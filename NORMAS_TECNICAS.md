# 📜 NORMAS TÉCNICAS, REGLAS DE NEGOCIO Y CONTEXTO PARA IA — BAIFA POWER TRACKING

Este documento reúne las directrices técnicas, arquitectónicas y de negocio obligatorias para el mantenimiento, evolución e iteración de la plataforma **BaiFa Power Tracking**. Tanto los desarrolladores como los agentes y modelos de Inteligencia Artificial deben seguir estrictamente estas normas.

---

## 1. 🏗️ Arquitectura Actual del Ecosistema (`release/v1.0.5`)

El workspace de **BaiFa Power Tracking** (`baifa/`) está compuesto por tres módulos principales y su configuración de entorno:

| Componente | Ruta en Workspace | Tecnología / Propósito | Puerto Host Local |
| :--- | :--- | :--- | :---: |
| **Backend REST API** | `baifa-api/` | Laravel 12 + PHP 8.4-FPM + Nginx Alpine + Laravel Sanctum | `14001` |
| **Base de Datos** | `baifa-api/` (`db`) | MySQL 8.0 (`baifa_api_db`, volumen persistente `baifa_api_dbdata`) | `14002` |
| **Frontend Web App** | `baifa-ui/` | Nuxt 4 + Vue 3 (`<script setup lang="ts">`) + Vuetify 3 + Tailwind CSS | `15001` |
| **Documentación y Activos** | `baifa-docs/` | Especificación OpenAPI 3.1, reglas de negocio, guías DevOps, informes y releases | N/A |

### Reglas de Infraestructura y Contenedores
1. **Puertos Locales Oficiales:**
   * **Backend API (`baifa-api`):** Puerto **`14001`** (`http://localhost:14001/api`).
   * **Frontend Web (`baifa-ui`):** Puerto **`15001`** (`http://localhost:15001`).
   * **Base de Datos MySQL (`baifa_api_db`):** Puerto **`14002`** en el host (`3306` interno en la red Docker `baifa_network`).
2. **Ejecución 100% Contenerizada:**
   * Todos los comandos de PHP, Composer, Artisan y MySQL se ejecutan dentro del contenedor del backend: `docker compose exec app <comando>`.
   * No ejecutar pruebas (`php artisan test`) ni formateadores (`./vendor/bin/pint`, `eslint`) de forma automática salvo solicitud explícita del usuario.

---

## 2. 👥 Roles de Usuario (RBAC) y Control de Acceso

El sistema implementa control de acceso basado en roles mediante Laravel Sanctum (`auth:sanctum`) y el middleware `role`:

| Rol (`UserRole`) | Etiqueta UI | Alcance y Permisos |
| :--- | :--- | :--- |
| **`admin`** | Superadministrador | Control total del sistema, gestión de usuarios (`/users`), directorio fiscal de clientes (`/clients`), catálogo de generadores (`/generators`), checkpoints y reportes. |
| **`manager`** | Jefe / Gerente | Supervisión operativa, métricas globales, gestión de clientes, inventario de generadores, puntos de control y reportes ejecutivos (`/reports`). |
| **`employee`** | Operador | Gestión operativa de clientes, inventario de generadores y actualización manual de puntos de control en ruta (`/tracking`). Sin acceso a gestión de usuarios. |
| **`client`** | Cliente Empresarial | Portal exclusivo de autogestión: visualización únicamente de los generadores asignados a su ficha fiscal (`client_id`) y consulta detallada de su trazabilidad. |
| **Invitado (Público)** | Modo Huésped | Consulta pública de rastreo por serial (`/tracking/:serial` o `/tracking?serial=...`) estilo MRW con datos sensibles protegidos (`PublicGeneratorResource`). |

### Credenciales Institucionales Sembradas (`DatabaseSeeder`)
* **Superadministrador:** `admin@baifa.com.ve` / `12345678` (alterno: `admin@admin` / `12345678`)
* **Gerente Operativo:** `gerente@baifa.com.ve` / `12345678`
* **Operador de Campo:** `operador@baifa.com.ve` / `12345678`
* **Cliente Demo:** `cliente.real@empresa.com` / `12345678`

---

## 3. ⚡ Estados Logísticos del Generador (`GeneratorStatus`)

El ciclo de vida logístico de cada generador eléctrico es **100% manual** (auditado por operadores en campo) y consta de 5 estados:

| Valor Enum | Etiqueta en Español | Color UI (Tailwind / Vuetify) | Significado Operativo |
| :--- | :--- | :--- | :--- |
| **`warehouse`** | En Warehouse | Violeta (`violet-400`) | Equipo ingresado o disponible en almacén central BaiFa. |
| **`in_transit`** | En Tránsito | Azul cielo (`sky-400`) | Unidad despachada en ruta hacia las instalaciones del cliente. |
| **`checkpoint`** | En Punto de Control | Amarillo (`yellow-400`) | Unidad verificada o retenida temporalmente en alcabala / punto de control. |
| **`delivered`** | Entregado | Verde (`green-400`) | Equipo recibido en la locación física del cliente. |
| **`installed`** | Instalado | Esmeralda (`emerald-300`) | Generador instalado, probado y 100% operativo en planta. |

---

## 4. 🎨 Identidad Visual y Reglas de Interfaz (`baifa-ui`)

* **Tema Oscuro Permanente (Dark Mode Industrial):**
  * **Fondo Principal (`baifa.bg`):** `#0b1120`
  * **Superficies y Sidebar (`baifa.sidebar`):** `#0f172a`
  * **Tarjetas (`baifa.card`):** `#131d31`
  * **Bordes (`baifa.border`):** `#1e293b`
  * **Verde Corporativo BaiFa (`baifa.green`):** `#3eb134` (Hover: `#349b2c`)
  * **Naranja de Acento Logístico (`baifa.orange`):** `#f97316` (Hover: `#ea580c`)
* **Coexistencia Vuetify 3 + Tailwind CSS:**
  * `corePlugins: { preflight: false }` en `baifa-ui/tailwind.config.ts` es obligatorio para no alterar los estilos base de los componentes de Vuetify 3.
  * Todos los componentes utilizan `<script setup lang="ts">` con tipado estricto en `types/`.

---

## 5. 🧼 Estándares de Backend (`baifa-api`)

1. **Flujo de Peticiones Limpio:**
   `Form Request (Validación en español)` -> `Controlador Delgado` -> `Modelo Eloquent` -> `API Resource (JSON estandarizado)`.
2. **Logs Categorizados en Español:**
   Prefijos estándar: `[AUTH_INFO]`, `[AUTH_ERROR]`, `[CLIENTES_INFO]`, `[CLIENTES_ERROR]`, `[GENERADORES_INFO]`, `[GENERADORES_ERROR]`, `[TRACKING_INFO]`, `[TRACKING_ERROR]`.
3. **Documentación OpenAPI Sincronizada:**
   Cualquier cambio en rutas o esquemas debe actualizarse simultáneamente en `baifa-api/docs/openapi.yaml` y `baifa-docs/api-spec/openapi.yaml`.
4. **Estándar de Versionado:**
   * Ramas y tags en GitHub: `release/vX.Y.Z` (actual: `release/v1.0.5`).
   * Tags de imágenes en Docker Hub: `release-X.Y.Z` (actual: `release-1.0.5`).

---

*Documento oficial actualizado y en vigencia técnica para todo el desarrollo y asistencia por IA de BaiFa Power Tracking.*
