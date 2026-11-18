# 📜 NORMAS TÉCNICAS, REGLAS DE NEGOCIO Y CONTEXTO PARA IA — BAIFA POWER TRACKING

Este documento reúne las directrices técnicas, arquitectónicas y de negocio **obligatorias** para el mantenimiento, evolución e iteración de la plataforma **BaiFa Power Tracking**. Tanto los desarrolladores como los agentes y modelos de Inteligencia Artificial deben seguir estrictamente estas normas en **todas las tareas**.

---

## 1. 🏗️ Arquitectura Actual del Ecosistema (`release/v1.0.8`)

El workspace de **BaiFa Power Tracking** (`baifa/`) está compuesto por tres repositorios independientes y su configuración de entorno:

| Componente / Repositorio | Ruta en Workspace | Remoto GitHub | Tecnología / Propósito | Puerto Host Local |
| :--- | :--- | :--- | :--- | :---: |
| **Backend REST API** | `baifa-api/` | `git@github.com:juaneliezer13/baifa-api.git` | Laravel 12 + PHP 8.4-FPM + Nginx Alpine + Laravel Sanctum | `14001` |
| **Base de Datos** | `baifa-api/` (`db`) | *(Servicio Docker)* | MySQL 8.0 (`baifa_api_db`, volumen persistente `baifa_api_dbdata`) | `14002` |
| **Frontend Web App** | `baifa-ui/` | `git@github.com:juaneliezer13/baifa-ui.git` | Nuxt 4 + Vue 3 (`<script setup lang="ts">`) + Vuetify 3 + Tailwind CSS | `15001` |
| **Documentación y Activos** | `baifa-docs/` | `git@github.com:juaneliezer13/baifa-docs.git` | Especificación OpenAPI 3.1, reglas de negocio, guías DevOps, informes y releases | N/A |

### Reglas de Infraestructura y Contenedores
1. **Puertos Locales Oficiales (Inamovibles):**
   * **Backend API (`baifa-api`):** Puerto **`14001`** (`http://localhost:14001/api`).
   * **Base de Datos MySQL (`baifa_api_db`):** Puerto **`14002`** en el host (`3306` interno en la red Docker `baifa_network`).
   * **Frontend Web (`baifa-ui`):** Puerto **`15001`** (`http://localhost:15001`).
2. **Ejecución 100% Contenerizada y Manual:**
   * Todos los comandos de PHP, Composer, Artisan y MySQL se ejecutan dentro del contenedor del backend: `docker compose exec app <comando>`.
   * **PROHIBIDO** ejecutar pruebas (`php artisan test`, `npm test`) ni formateadores/linters (`./vendor/bin/pint`, `eslint`) de forma automática salvo solicitud explícita del usuario.

---

## 2. 🏷️ Estándar Obligatorio de Versionado, Ramas y Tags (GitHub vs Docker Hub)

1. **GitHub (`baifa-api`, `baifa-ui` y `baifa-docs`):**
   * **Ramas de Release:** `release/vX.Y.Z` (ej. `release/v1.0.8`).
   * **Tags de Git/GitHub:** `release/vX.Y.Z` (ej. `release/v1.0.8` -> `https://github.com/juaneliezer13/baifa-api/releases/tag/release%2Fv1.0.8`).
   * ❌ **PROHIBIDO** crear tags sueltos con formato `vX.Y.Z` sin el prefijo `release/`.
   * 💡 **Nota Técnica de Git:** Como la rama y el tag comparten el nombre `release/vX.Y.Z`, siempre deben emplearse referencias completas (`refs/heads/release/vX.Y.Z` y `refs/tags/release/vX.Y.Z`) al crear tags, mover ramas (`main`, `develop`) o hacer `git push`.
2. **Docker Hub (Imágenes de Contenedores):**
   * **Tags de Imagen Docker:** `release-X.Y.Z` (ej. `juaneliezer13/baifa-api:release-1.0.8` y `juaneliezer13/baifa-ui:release-1.0.8`).

---

## 3. 🛡️ Reglas de Producción: Cero Data Dummy y Validaciones de Formularios

1. **Cero Data Dummy en Código de Producción:**
   * Prohibido incluir botones de acceso rápido de demostración, credenciales quemadas en vistas, mocks de fallback o contadores estáticos ficticios.
   * `DatabaseSeeder.php` únicamente aprovisiona la cuenta inicial del Superadministrador (`admin@baifa.com.ve`). Cualquier credencial de prueba local debe anotarse fuera del repositorio.
2. **Validación y Auto-Formateo Obligatorio en Todos los Formularios:**
   * **Frontend (`baifa-ui/app/utils/validators.ts`):** Todo formulario o modal debe validar y auto-formatear en tiempo real:
     * **RIF Venezolano (`formatRifInput`, `rifRules`):** Formato `J-12345678-9` (prefijos `J, G, V, E, P, C`).
     * **Cédula de Identidad (`formatCedulaInput`, `cedulaRules`):** Formato `V-12345678` o `E-81234567` (6 a 9 dígitos).
     * **Teléfono (`formatPhoneInput`, `phoneRules`):** Formato nacional `0414-1234567` / `0212-5551234` o internacional `+58 414-1234567`.
     * **Correo Electrónico (`normalizeEmailInput`, `emailRules`):** Estructura completa con dominio y TLD válido.
     * **Seriales, kVA, Checkpoints y Fotos:** Validación de seriales (`GEN-2026-0041`), potencia `> 0 kVA`, ubicaciones de puntos de control y archivos de imagen (`JPEG, PNG, WebP` hasta `5 MB`).
   * **Backend (`baifa-api/app/Http/Requests/`):** Toda petición `POST`, `PUT` o `PATCH` debe validarse mediante su respectivo `FormRequest` con expresiones regulares equivalentes y mensajes de error en español.

---

## 4. 👥 Roles de Usuario (RBAC) y Control de Acceso

El sistema implementa control de acceso basado en roles mediante Laravel Sanctum (`auth:sanctum`) y el middleware `role`:

| Rol (`UserRole`) | Etiqueta UI | Alcance y Permisos |
| :--- | :--- | :--- |
| **`admin`** | Superadministrador | Control total del sistema, gestión de usuarios (`/users`), directorio fiscal de clientes (`/clients`), catálogo de generadores (`/generators`), checkpoints, reportes (`/reports`) y gestión de su perfil (`/profile`). |
| **`manager`** | Jefe / Gerente | Supervisión operativa, métricas globales, gestión de clientes, inventario de generadores, puntos de control, reportes ejecutivos (`/reports`) y gestión de su perfil (`/profile`). |
| **`employee`** | Empleado | Acceso operativo limitado: registro/edición de generadores y actualización manual de puntos de control en ruta (`/generators`, `/tracking`), consulta en solo lectura del directorio de clientes (`/clients`) y gestión de su propio perfil (`/profile`). Sin acceso a usuarios (`/users`), reportes ejecutivos (`/reports`) ni eliminación de registros. |
| **`client`** | Cliente Empresarial | Portal exclusivo de autogestión: visualización únicamente de los generadores asignados a su ficha fiscal (`client_id`), consulta detallada de su trazabilidad y gestión de su perfil corporativo (`/profile`). |
| **Invitado (Público)** | Modo Huésped | Consulta pública de rastreo por serial (`/tracking/:serial` o `/tracking?serial=...`) estilo MRW con datos sensibles protegidos (`PublicGeneratorResource`). |

---

## 5. ⚡ Estados Logísticos del Generador (`GeneratorStatus`)

El ciclo de vida logístico de cada generador eléctrico es **100% manual** (auditado por operadores) y consta de **7 estados**:

| Valor Enum | Etiqueta en Español | Color UI (Tailwind / Vuetify) | Significado Operativo |
| :--- | :--- | :--- | :--- |
| **`purchase_order`** | Orden de Compra | Violeta (`violet-400`) | Orden de compra emitida y confirmada para el generador. |
| **`in_production`** | En Producción | Ámbar (`amber-400`) | Unidad en línea de ensamblaje y pruebas de fábrica. |
| **`origin_customs`** | En Aduana de Origen | Naranja (`orange-400`) | Trámites de exportación y despacho en puerto de origen. |
| **`maritime_transit`** | En Tránsito Marítimo | Azul cielo (`sky-400`) | Embarcado en buque de carga en navegación hacia puerto destino. |
| **`destination_customs`** | En Aduana Destino | Amarillo (`yellow-400`) | Arribo a puerto nacional y proceso de desaduanamiento. |
| **`baifa_warehouse`** | En Almacén BaiFa | Cian (`cyan-400`) | Equipo verificado y resguardado en almacén central BaiFa. |
| **`delivered`** | Entregado | Esmeralda (`emerald-400`) | Generador entregado formalmente en las instalaciones del cliente. |

---

## 6. 🎨 Identidad Visual y Reglas de Interfaz (`baifa-ui`)

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

## 7. 🧼 Estándares de Backend (`baifa-api`) y Documentación (`baifa-docs`)

1. **Flujo de Peticiones Limpio:**
   `Form Request (Validación en español)` -> `Controlador Delgado` -> `Modelo Eloquent` -> `API Resource (JSON estandarizado)`.
2. **Logs Categorizados en Español:**
   Prefijos estándar: `[AUTH_INFO]`, `[AUTH_ERROR]`, `[CLIENTES_INFO]`, `[CLIENTES_ERROR]`, `[GENERADORES_INFO]`, `[GENERADORES_ERROR]`, `[TRACKING_INFO]`, `[TRACKING_ERROR]`, `[REPORTES_INFO]`, `[REPORTES_ERROR]`.
3. **Documentación Centralizada en `baifa-docs`:**
   * Cualquier cambio en rutas, esquemas o versiones debe actualizarse simultáneamente en `baifa-api/docs/openapi.yaml` y en el repositorio de documentación `baifa-docs/api-spec/openapi.yaml`, además de registrar su nota de versión en `baifa-docs/releases/`.
