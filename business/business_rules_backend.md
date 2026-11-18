# 📋 Libro de Reglas de Negocio, Alcance y Hoja de Ruta - baifa-api

Este documento es la **fuente única de verdad** de todos los requerimientos, reglas funcionales, hitos y acuerdos comerciales establecidos con el cliente para el desarrollo del **Sistema Web de Tracking Logístico de Generadores Eléctricos**.

---

## 🧭 Hoja de Ruta Comercial Aceptada (5 Etapas Progresivas)

El proyecto se desarrolla y entrega bajo una **Metodología de Entregas Progresivas y Funcionales** dividida en 5 etapas consecutivas (Total acordado: **$1,500.00 USD** | Tiempo estimado: **12 a 16 semanas**):

| Etapa | Módulo / Entregable Principal | Alcance Funcional | Inversión Acordada | Anticipo (60%) | Cierre (40%) | Estado |
| :---: | :--- | :--- | :---: | :---: | :---: | :---: |
| **1** | **Accesos y Directorio** | Control de Accesos, Roles de Usuario y Directorio Fiscal de Clientes. | $245.00 USD | $147.00 | $98.00 | ✅ **[Completado 100%]** |
| **2** | **Catálogo de Inventario** | Catálogo de Inventario, Ficha de Generadores, seriales únicos y cargador de fotos. | $285.00 USD | $171.00 | $114.00 | ✅ **[Completado 100%]** |
| **3** | **Puntos de Control** | Puntos de Control (*checkpoints*), Órdenes de Envío y actualización manual de ruta. | $400.00 USD | $240.00 | $160.00 | ✅ **[Completado 100%]** |
| **4** | **Bitácora Histórica** | Bitácora Histórica inmutable y registro de trazabilidad con consulta pública/privada. | $245.00 USD | $147.00 | $98.00 | ✅ **[Completado 100%]** |
| **5** | **Dashboard y Reportes** | Portal de Autoconsulta para Clientes y Tablero de Reportes Generales de Supervisión. | $325.00 USD | $195.00 | $130.00 | ✅ **[Completado 100%]** |
| **TOTAL** | **Sistema Integral Operativo** | **Plataforma completa (Backend API + Base de Datos + Frontend)** | **$1,500.00 USD** | **$900.00** | **$600.00** | **Operativo (`v1.0.5`)** |

---

## 📜 Protocolo de Aceptación y Reglas Comerciales
* **Criterio de Avance:** No se inicia una etapa nueva si la anterior no está probada y validada al 100% por el cliente.
* **Flujo Financiero:** Cada etapa contempla un 60% al inicio y un 40% contra entrega demostrada y aprobada.
* **Alcance Exclusivo:** El servicio contempla diseño lógico, desarrollo de código fuente (API Laravel, Base de datos y Frontend Vue/Nuxt). No incluye infraestructura de hosting/servidores ni dominios.

---

## 📦 Detalle de Reglas de Negocio por Módulo

### 🔹 ETAPA 1: Control de Accesos y Directorio de Clientes

#### Módulo 1.1: Autenticación y Control de Roles (RBAC) 🟢 [Completado]
* **`RN-AUTH-01` [Jerarquía de Roles]:**
  * `client` (Cliente): Visualización exclusiva de sus propios generadores y tracking.
  * `employee` (Empleado): Operadores logísticos (actualización manual de checkpoints).
  * `manager` (Jefe / Gerente): Supervisión, métricas y gestión de su equipo.
  * `admin` (Administrador): Control global de accesos y configuración técnica.
* **`RN-AUTH-02` [Registro por Defecto]:** Todo usuario público nuevo recibe rol `client`.
* **`RN-AUTH-03` [Sesiones y Tokens]:** Bearer Tokens con Laravel Sanctum revocables en `/logout`.
* **`RN-AUTH-04` [Formato de Respuestas]:** Retornar siempre `role` y `role_label` en español.

#### Módulo 1.2: Ficha Fiscal y Directorio de Clientes 🔴 [Planificado - SIGUIENTE PASO]
* **`RN-CLI-01` [CRUD Completo]:** Registro, consulta paginada, edición y eliminación lógica de clientes institucionales.
* **`RN-CLI-02` [Campos Obligatorios de la Ficha Fiscal]:**
  * Razón Social (nombre legal según registro fiscal).
  * Nombre Corto / Comercial de la empresa.
  * Número de RIF (único en el sistema con validación de formato).
  * Teléfono de oficinas.
  * Persona de Contacto: Nombre completo, Email de contacto, Teléfono directo.
* **`RN-CLI-03` [Vinculación de Usuarios]:** Capacidad de asociar una ficha de cliente a cuentas de usuario con rol `client`.
* **`RN-CLI-04` [Permisos]:** Solo accesible para personal interno (`employee`, `manager`, `admin`).

---

### 🔹 ETAPA 2: Catálogo de Inventario y Ficha de Generadores 🔴 [Planificado]

* **`RN-GEN-01` [Registro Inicial de Salida]:** Al despachar o registrar un generador se debe capturar:
  * Número de Serial de fábrica (único y obligatorio).
  * Cliente asignado (vinculado a la Ficha Fiscal de la Etapa 1).
  * Fecha estimada de llegada (ETA).
  * Fotografía referencial del activo (cargador de imágenes con almacenamiento en storage).
  * Capacidad y modelo del generador.
* **`RN-GEN-02` [Estados del Generador (7 Etapas Logísticas)]:**
  * `purchase_order` (Orden de Compra)
  * `in_production` (En Producción)
  * `origin_customs` (En Aduana de Origen)
  * `maritime_transit` (En Tránsito Marítimo)
  * `destination_customs` (En Aduana Destino)
  * `baifa_warehouse` (En Almacén BaiFa)
  * `delivered` (Entregado)

---

### 🔹 ETAPA 3: Puntos de Control y Órdenes de Envío 🔴 [Planificado]

* **`RN-TRK-01` [Gestión Estrictamente Manual]:** Los cambios de estatus y avance de ruta **NO son automáticos ni por GPS**. Son editados manualmente por los operadores a medida que el equipo avanza.
* **`RN-TRK-02` [Puntos de Control Personalizables]:** Los operadores pueden registrar la llegada a puntos de control específicos (nombre de checkpoint, fecha, observaciones).

---

### 🔹 ETAPA 4: Bitácora Histórica y Registro de Trazabilidad 🔴 [Planificado]

* **`RN-BIT-01` [Bitácora Inmutable]:** Cada cambio de estatus o punto de control dispara un registro inmutable en base de datos con:
  * ID del generador.
  * Punto de control y estatus asignado.
  * Fecha y hora exacta.
  * Usuario responsable que realizó la modificación.
  * Observaciones de la parada/movimiento.

---

### 🔹 ETAPA 5: Portal de Clientes y Tablero de Reportes 🔴 [Planificado]

* **`RN-PRT-01` [Aislamiento Estricto para Clientes]:** El cliente solo puede consultar y rastrear generadores asociados a su empresa.
* **`RN-PRT-02` [Buscador y Línea de Tiempo]:** Buscador de generador por serial y vista interactiva del historial cronológico completo de puntos de control.
* **`RN-REP-01` [Reportes de Supervisión]:** Reporte de generadores en tránsito (filtrable por estatus y cliente), directorio de clientes y estado global de generadores (exclusivo para `manager` y `admin`).

---

### 🔹 Módulo de Notificaciones por Correo Electrónico 🟢 [Completado]

* **`RN-NOTIF-01` [Remitente Oficial del Sistema]:** Todos los correos transaccionales son emitidos con la cuenta institucional `chirinosjuane@gmail.com` bajo el remitente `BaiFa Power`.
* **`RN-NOTIF-02` [Bienvenida y Registro de Clientes]:** Al registrarse un cliente (auto-registro en `/register` o creación administrativa en `/clients`), se envía una notificación moderna y elegante (`WelcomeClientMail`) con razón social, RIF, credenciales de acceso iniciales (si aplica) y acceso directo al portal.
* **`RN-NOTIF-03` [Creación de Usuarios en el Sistema]:** Al crear cualquier usuario (sea cliente, empleado, gerente o administrador en `/users`), se notifica al destinatario (`WelcomeUserCreatedMail`) con su rol, contraseña inicial y enlace de inicio de sesión.
* **`RN-NOTIF-04` [Actualización de Generadores y Estatus]:** Al modificar los datos de un generador asignado a un cliente (`/generators/{generator}`), se notifica automáticamente al cliente (`GeneratorUpdatedMail`), resaltando la transición de estatus operativo y los campos modificados.
* **`RN-NOTIF-05` [Avances de Puntos de Control y Checkpoints]:** Al registrar un nuevo punto de control de ruta (`/generators/{generator}/checkpoints`), se envía una notificación al cliente (`GeneratorCheckpointMail`) detallando la ubicación, fecha, notas de ruta y destacando hitos culminantes como llegada a destino (`delivered`) y disponibilidad operativa (`installed`).

---

### 🔹 Módulo de Soporte, Helpdesk y Chat en Vivo (Tickera) 🟢 [Implementado Backend]

* **`RN-SUPPORT-01` [Creación de Tickets por el Cliente]:** El cliente puede generar un ticket de soporte tras ingresar el título de su consulta (obligatorio), área técnica y detalles opcionales. El ticket se inicializa en base de datos con código único correlativo (`TKT-YYYY-XXXX`) y estado inicial `pending` (En Espera).
* **`RN-SUPPORT-02` [Helpdesk y Tickera Centralizada]:** El personal interno (`admin`, `manager`, `employee`) dispone de la Tickera para supervisar todos los tickets generados, con filtros avanzados por estatus, categoría temática, operador asignado y búsqueda textual.
* **`RN-SUPPORT-03` [Asignación y Toma de Tickets]:** Un administrador puede asignar un ticket a cualquier empleado del equipo, y cualquier empleado o administrador puede "tomar el ticket" directamente de la tickera. Al asignarse un operador, el ticket transiciona automáticamente a `in_progress` (En Proceso) y habilita la sala de chat en vivo.
* **`RN-SUPPORT-04` [Restricción Estricta de Estados para Clientes]:** El cliente no puede modificar el estatus de sus tickets ni cancelarlos. Dichas operaciones están estrictamente reservadas para `admin`, `manager` y `employee`. Si un cliente lo intenta, la API retorna `403 Forbidden`.
* **`RN-SUPPORT-05` [Finalización y Cancelación con Comentario Obligatorio]:** Para cambiar el estatus de un ticket a `finished` (Finalizado) o `cancelled` (Cancelado), el operador o administrador debe suministrar obligatoriamente un comentario final explicativo (`final_comment`), guardando la fecha de cierre (`closed_at`).
* **`RN-SUPPORT-06` [Notificación por Correo en Cambios de Estatus]:** Todo cambio de estatus de un ticket dispara notificaciones automáticas vía `chirinosjuane@gmail.com` tanto al correo del cliente como al del empleado asignado (`TicketStatusUpdatedMail`), detallando la transición, el operador responsable y el comentario o resolución.
* **`RN-SUPPORT-07` [Bitácora Histórica y Chat en Vivo]:** Cada evento y evolución del ticket se registra inmutablemente en `ticket_logs`. El chat interactivo guarda los mensajes en `ticket_messages`. El cliente visualiza el chat flotante activo mientras tenga un ticket en estado `pending` o `in_progress`; en caso de no tener tickets activos, solo verá el botón flotante para generar uno nuevo. Las consultas anteriores se consultan en el módulo "Mis Consultas" (`/v1/support/my-tickets`).

---

## 🎨 Prototipo de Interfaz y Referencia Visual (Figma)
* **URL del Prototipo Interactivo:** [https://layer-ethics-21492417.figma.site](https://layer-ethics-21492417.figma.site)
* **Especificación detallada de vistas, modales y campos:** [docs/business/diseno_figma.md](business/diseno_figma.md)
* **Estructura de Vistas:** Panel de Control (Dashboard), Catálogo de Generadores, Directorio de Clientes, Rastrear Generador (Timeline), Usuarios del Sistema y Reportes.