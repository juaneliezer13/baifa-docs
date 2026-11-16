# 📄 Informe Técnico-Comercial: Entrega Etapa 1 y Alcance Etapa 2
**Proyecto:** Sistema Web de Tracking Logístico de Generadores Eléctricos — BaiFa  
**Documento:** Informe Ejecutivo / Mini-Whitepaper de Avance  
**Versión:** 1.0  
**Fecha:** Septiembre 2026  
**Estado:** Etapa 1 [Entregada para Aprobación] | Etapa 2 [Planificada para Inicio]  

---

## 📌 1. Resumen Ejecutivo y Propósito

El presente documento resume de manera puntual y ejecutiva los avances entregados correspondientes a la **Etapa 1** del proyecto y define el alcance inmediato de la **Etapa 2**, según los términos establecidos en la **Propuesta Comercial**, el **Contrato de Desarrollo de Software** y la **Planificación Progresiva Aceptada por el Cliente**.

El objetivo central del proyecto es dotar a **BaiFa** de una plataforma tecnológica propia, segura y escalable que permita el rastreo logístico manual de generadores eléctricos, la gestión de clientes institucionales y la transparencia operativa mediante un portal diferenciado.

---

## 🧭 2. Marco Comercial y Metodología de Entregas Progresivas

El desarrollo fue acordado bajo una metodología de **5 etapas progresivas y funcionales**. Cada etapa es independiente, operativa y requiere la validación del cliente antes de iniciar la siguiente:

| Etapa | Módulo Principal | Alcance General Acordado | Inversión | Estado |
| :---: | :--- | :--- | :---: | :---: |
| **1** | **Accesos, Usuarios y Directorio** | Autenticación, Roles (RBAC), Registro, Recuperación, Usuarios y Directorio Fiscal. | $245.00 USD | 🟢 **Entregada (Revisión)** |
| **2** | **Catálogo de Inventario** | Ficha de Generadores, seriales únicos, vinculación a clientes y fotos. | $285.00 USD | 🟡 **Siguiente Etapa** |
| **3** | **Puntos de Control** | Checkpoints manuales, órdenes de despacho y actualización de ruta. | $400.00 USD | ⚪ Planificado |
| **4** | **Bitácora Histórica** | Trazabilidad inmutable, registro histórico de paradas y cambios. | $245.00 USD | ⚪ Planificado |
| **5** | **Dashboard y Reportes** | Portal de Autoconsulta del Cliente y Reportes Generales de Supervisión. | $325.00 USD | ⚪ Planificado |

---

## ✅ 3. Alcance Entregado: Etapa 1 (Accesos, Usuarios y Registro)

En esta primera etapa se completó la arquitectura base de seguridad, control de usuarios y registro del sistema tanto en el Backend (API Laravel 11 / Docker / MySQL) como en el Frontend (Nuxt 3 / Vue 3 / Tailwind / Vuetify):

### 3.1. Autenticación y Seguridad (Sanctum)
- Inicio de sesión seguro con tokens Bearer (`/api/v1/auth/login`).
- Cierre de sesión con revocación activa de tokens en servidor y limpieza en cliente (`/logout`).
- Persistencia de sesión con cookies protegidas y middleware global de rutas públicas y privadas.

### 3.2. Control de Acceso Basado en Roles (RBAC) y Vistas Diferenciadas
- Soporte para 4 niveles de privilegios:
  1. **Superadministrador / Administrador (`admin`):** Acceso total al menú, auditoría y gestión de usuarios.
  2. **Jefe / Gerente (`manager`):** Supervisión operativa y métricas.
  3. **Empleado / Operador (`employee`):** Registro de estados y seguimiento de maquinaria.
  4. **Cliente (`client`):** Experiencia simplificada sin menús internos. Al iniciar sesión ingresa a un portal de bienvenida limpio con accesos a *"Mis pedidos"*, *"Mi lista de compras"* y *"Ver generadores"*.

### 3.3. Registro de Clientes y Validación de Correo Único
- Formulario de solicitud de acceso público (`/register`). Todo nuevo registro público se asigna automáticamente con el rol `client`.
- **Validación estricta de correo único:** Si el correo ya existe en base de datos, el sistema impide el registro y muestra de inmediato el mensaje de error visual correspondiente tanto a nivel de formulario como bajo el campo específico.
- **Notificación por correo electrónico:** Envío de correo transaccional de bienvenida dando la confirmación de cuenta habilitada como Cliente (sin exponer claves por seguridad).

### 3.4. Módulo de Gestión de Usuarios del Sistema (CRUD)
- Vista exclusiva para Administradores (`/users`) conectada en tiempo real a la API.
- Creación, listado con filtros (búsqueda, rol y estado), edición de datos y eliminación lógica.
- **Protección de cuenta propia:** Ningún administrador puede modificarse o eliminarse a sí mismo desde este módulo para evitar bloqueos accidentales.
- **Notificación de credenciales al nuevo usuario:** Al crear un colaborador desde la administración, el sistema envía un correo notificando su correo, rol asignado y su contraseña inicial.

### 3.5. Recuperación y Restablecimiento de Contraseña
- **Solicitud (`/forgot-password`):** Generación de tokens seguros con expiración de 60 minutos y envío de correo transaccional con enlace directo de restablecimiento.
- **Actualización (`/reset-password`):** Pantalla receptora de token y correo que permite ingresar la nueva clave, validando longitud mínima y confirmación, revocando sesiones antiguas e invalidando el token.
- **Protección de cuentas institucionales de prueba:** Bloqueo explícito en backend y frontend para `admin@baifa.com.ve` y `cliente.real@empresa.com`, respondiendo con alerta de seguridad.

### 3.6. Estructura y Directorio de Clientes
- Modelo de datos y endpoints preparados para asociar usuarios finales a la ficha fiscal de su respectiva empresa contratante.

---

## 🚀 4. Alcance Pendiente: Etapa 2 (Catálogo de Inventario y Ficha de Generadores)

Habiendo cumplido el 100% de la Etapa 1, la **Etapa 2** comprende la construcción del núcleo de inventario y activos físicos de BaiFa:

### 4.1. Ficha Técnica del Generador
- Registro individual de generadores con captura de:
  - **Serial de fábrica:** Identificador alfanumérico único e irrepetible.
  - **Modelo y capacidad:** Potencia (kVA / kW), motor y especificaciones del equipo.
  - **Cliente asignado:** Vinculación directa con la empresa compradora registrada en la Etapa 1.
  - **Fecha estimada de entrega (ETA):** Cronograma referencial de llegada.

### 4.2. Galería Fotográfica del Activo (Media Storage)
- Módulo de carga y almacenamiento de fotografías reales del generador al momento del despacho/registro (inspección visual, estado de empaque y cabina insonorizada).

### 4.3. Máquina de Estados Base del Generador
- Soporte para el ciclo de vida del equipo:
  1. `En Almacén` (*Warehouse*)
  2. `En Tránsito` (*In Transit*)
  3. `En Punto de Control` (*Checkpoint*)
  4. `Entregado` (*Delivered*)
  5. `Instalado y Operativo` (*Installed*)

### 4.4. Catálogo Interactivo en Frontend
- Vista de listado tipo tarjeta y tabla con filtros por estado, cliente y modelo.
- Modales para dar de alta nuevas unidades y editar información técnica.

---

## 📊 5. Estado Actual y Próximos Pasos

1. **Revisión y Aceptación de la Etapa 1:**
   - La Etapa 1 se encuentra 100% implementada, respaldada en Git (`develop`) y verificada mediante suite de pruebas automatizadas con capturas documentadas.
   - Procede la validación por parte del cliente y la liquidación del 40% de cierre de la Etapa 1 ($98.00 USD).
2. **Activación de la Etapa 2:**
   - Liquidación del anticipo del 60% de la Etapa 2 ($171.00 USD).
   - Inicio inmediato del diseño de migraciones de inventario, carga de imágenes y vistas del catálogo de generadores.

---
*Documento elaborado para fines de control técnico, seguimiento comercial y auditoría de hitos de entrega — BaiFa 2026.*
