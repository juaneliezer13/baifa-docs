# 📄 INFORME DE PROYECTO: ETAPA 1 — ARQUITECTURA, ACCESOS Y GESTIÓN DE IDENTIDADES

**Proyecto:** Sistema Web de Rastreo Logístico y Gestión de Generadores Eléctricos — BaiFa  
**Documento:** Informe Técnico de Proyecto / Memoria de Entrega  
**Fase:** Etapa 1 (Estructura Base, Seguridad, Control de Acceso y Gestión de Usuarios/Clientes)  
**Fecha:** Septiembre de 2026  
**Autor:** Equipo de Desarrollo de Software  

---

## 🎯 1. Objetivo General del Hito Inicial (Etapa 1)

El propósito central de esta primera etapa ha sido diseñar, construir y desplegar la **estructura fundamental y los cimientos tecnológicos del sistema**, garantizando una arquitectura moderna, segura, desacoplada y escalable. 

En esta fase se entrega el **núcleo de seguridad, autenticación, control de acceso basado en roles (RBAC)** y la **gestión integral de identidades** (personal interno de BaiFa y empresas clientes), sirviendo como la plataforma sobre la cual operarán los módulos logísticos e industriales en las fases subsiguientes.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           ARQUITECTURA ETAPA 1                          │
│                                                                         │
│  [ Nuxt 4 + Vue 3 + Vuetify ]   <--->   [ Laravel 11 + Sanctum API ]    │
│        (Frontend Web / SPA)                     (Backend REST)          │
│                 │                                      │                │
│                 ▼                                      ▼                │
│       [ Nginx Reverse Proxy ]           [ Base de Datos MySQL 8.0 ]     │
│                 └───────────────┬──────────────────────┘                │
│                                 ▼                                       │
│                    [ Docker / AWS EC2 Cloud ]                           │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 👥 2. Tipos de Usuarios Planificados en el Sistema

El sistema implementa un modelo de autorización riguroso según la responsabilidad de cada actor dentro de la cadena operativa:

| Rol | Identificador | Nivel de Acceso y Responsabilidad |
| :--- | :---: | :--- |
| **Superadministrador** | `admin` | **Control total del sistema.** Acceso integral a la configuración global, auditoría, gestión y permisos de usuarios internos, y directorio fiscal de clientes. |
| **Jefe / Gerente** | `manager` | **Supervisión operativa.** Consulta de métricas globales, seguimiento de inventario, aprobación de solicitudes y reportes de gestión general. |
| **Operador** | `employee` | **Gestión logística de campo.** Actualización de estados y puntos de control de generadores eléctricos, inspección técnica y consulta de fichas de clientes (sin acceso a administración de usuarios). |
| **Cliente Empresarial** | `client` | **Portal exclusivo de autogestión.** Consulta en tiempo real de sus propios pedidos, seguimiento logístico de sus generadores comprados o alquilados y solicitudes de cotización/soporte. |

---

## ⚙️ 3. Funcionalidades Desarrolladas e Implementadas (Etapa 1)

Durante el ciclo intensivo de desarrollo se diseñaron y validaron al 100% las siguientes funcionalidades funcionales:

### 3.1. Autenticación, Sesión y Seguridad
- **Inicio de Sesión (`Login`):** Autenticación de credenciales mediante tokens de acceso Bearer criptográficos (*Laravel Sanctum*), con validación en tiempo real y persistencia en cookies seguras.
- **Cierre de Sesión (`Logout`):** Invocación segura al backend para la revocación y destrucción del token activo en la base de datos, con limpieza inmediata del estado y redirección en el frontend.

### 3.2. Registro Público con Creación Atómica de Empresa Cliente
- **Registro de Acceso (`Register`):** Formulario público que solicita obligatoriamente el **RIF** (con validación de formato venezolano `J-12345678-9` y comprobación de unicidad) y la **Razón Social** de la empresa, además de los datos de contacto y contraseña.
- **Lógica Transaccional:** En una única transacción de base de datos (`DB::transaction`), el sistema crea en simultáneo la cuenta de usuario con rol `client` y la ficha jurídica de la empresa cliente en la tabla `clients`, vinculándolas formalmente (`user_id`).

### 3.3. Recuperación y Restablecimiento de Contraseñas
- **Solicitud de Recuperación (`Forgot Password`):** Verificación de existencia del correo, emisión de tokens unívocos con expiración de 60 minutos y envío de correo transaccional con enlace seguro.
- **Restablecimiento de Contraseña (`Reset Password`):** Pantalla receptora de token y correo que valida confirmación de contraseña, actualiza el hash en la base de datos, invalida el token utilizado y revoca sesiones anteriores.

### 3.4. Sistema de Notificaciones y Correos de Bienvenida
- **Bienvenida al Usuario Operativo:** Al registrar un nuevo colaborador administrativo u operador desde el módulo de usuarios, el sistema despacha automáticamente un correo notificándole su cuenta, rol y credenciales de acceso iniciales.
- **Bienvenida al Cliente:** Al registrarse una empresa cliente o crearse desde el directorio fiscal, se despacha un correo institucional de bienvenida confirmando la habilitación de su cuenta corporativa.

### 3.5. Módulo de Gestión de Usuarios del Sistema (CRUD)
- Listado interactivo de usuarios internos (`/users`) con filtros por nombre, correo, rol y estado.
- Creación y edición de usuarios internos (`admin`, `manager`, `employee`).
- **Protección de cuenta propia:** Se bloquea la auto-eliminación o auto-desactivación del usuario que tiene la sesión iniciada para evitar bloqueos accidentales.
- **Regla de integridad para cuentas de tipo cliente:**
  - Se prohíbe crear usuarios con rol `client` desde este módulo (deben crearse vía Clientes).
  - El rol de los usuarios clientes es inmutable (no puede ser modificado).
  - **Protección de eliminación:** Se bloquea la eliminación directa de usuarios clientes, informando mediante una advertencia que debe eliminarse primero la empresa cliente.

### 3.6. Módulo del Directorio Fiscal de Clientes (CRUD)
- **Pantalla Principal (`/clients`):** Panel interactivo acorde al prototipo con tarjetas de métricas (Total Clientes, Activos, Inactivos), buscador reactivo en tiempo real y filtrado por estado.
- **Modal de Creación y Edición:** Captura de RIF (mayúsculas obligatorias), razón social, nombre corto, teléfono de oficina, nombre de persona de contacto, correo y teléfono celular.
- **Sincronización Bidireccional:** Cambiar el correo de contacto en Clientes actualiza el correo del usuario vinculado; y actualizar el correo del usuario cliente actualiza la ficha de contacto de la empresa.
- **Alternancia de Estado (`Toggle Status`):** Habilita o inhabilita a la empresa y sincroniza automáticamente el acceso a la plataforma de su usuario vinculado.
- **Eliminación en Cascada:** Al dar de baja una empresa cliente, el sistema revoca automáticamente sus sesiones activas y elimina en cascada la cuenta de usuario asociada.

### 3.7. Evidencias Visuales de la Interfaz Implementada

A continuación se exhiben capturas directas del sistema implementado:

1. **Autenticación e Inicio de Sesión (Login):**
   ![Inicio de Sesión y Roles](screenshots/18_login_green_implemented.png)

2. **Directorio Fiscal de Clientes (Listado y Métricas):**
   ![Directorio de Clientes](screenshots/05_clientes_lista.png)

3. **Formulario de Registro / Creación de Empresa Cliente:**
   ![Modal de Creación de Cliente](screenshots/06_modal_nuevo_cliente.png)

---

## 🔮 4. Visión de las Siguientes Etapas (Roadmap del Proyecto)

Habiendo consolidado la infraestructura base de accesos y perfiles de usuario, el proyecto avanzará progresivamente en las siguientes etapas planificadas:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      ROADMAP DE ETAPAS SIGUIENTES                       │
│                                                                         │
│  [ ETAPA 1 ] -->  [ ETAPA 2 ]  -->  [ ETAPA 3 ]  -->  [ ETAPA 4 y 5 ]   │
│   Accesos y         Catálogo de       Rastreo y          Portal y       │
│  Identidades        Generadores      Checkpoints         Reportes       │
│  (COMPLETADA)       (Siguiente)                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

1. **Módulo de Generadores Eléctricos (Catálogo e Inventario):**
   - Ficha técnica completa de plantas eléctricas (capacidad en kVA, motor diésel, modelos abiertos e insonorizados).
   - Control de inventario por seriales únicos de fábrica, vinculación a clientes y galería fotográfica de despacho.

2. **Dashboard de Autogestión del Cliente (Portal de Clientes):**
   - Vista especializada y personalizada para el cliente que muestra sus generadores adquiridos, catálogo interactivo de repuestos y módulos de "Mis Pedidos" y "Mi Lista de Compras/Cotizaciones".

3. **Sistema de Seguimiento y Guías de Despacho (Tracking Logístico):**
   - Pipeline de trazabilidad en tiempo real con línea de tiempo y puntos de control (*En Warehouse*, *En Tránsito*, *Punto de Control*, *Entregado*, *Instalado y Operativo*).
   - Consulta pública y privada mediante número de serial o código de seguimiento logístico.

4. **Módulo de Reportes Operativos e Inteligencia:**
   - Generación de reportes de supervisión, métricas de rendimiento, tiempos promedio de entrega y disponibilidad de maquinaria.

5. **Bitácoras Históricas y Auditoría del Sistema:**
   - Registro inmutable de auditoría para cada cambio de estado, movimiento de maquinaria, actualizaciones técnicas y accesos de usuario.

---

## 📝 5. Conclusión de la Entrega

La **Etapa 1** ha cumplido satisfactoriamente con la totalidad de los requerimientos técnicos y funcionales previstos:
- Se implementó una base de código robusta, modular y completamente tipada (TypeScript en Frontend, PHP 8.4 tipado estricto en Backend).
- Se configuró el despliegue contenerizado mediante Docker y Docker Compose en la nube pública (AWS EC2), asegurando alta disponibilidad.
- Se verificó la consistencia mediante suites de pruebas automatizadas unitarias, de integración y E2E superadas al 100%.

Con esta estructura funcional, el sistema se encuentra listo para iniciar de inmediato la **Etapa 2 (Módulo de Generadores Eléctricos)**.
