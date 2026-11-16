# 📄 Manual de Usuario y Reporte de Entrega · Versión v1.0.2
**Proyecto:** Sistema Web de Tracking Logístico de Generadores Eléctricos — BaiFa Power  
**Documento:** Manual de Usuario Ejecutivo y Memoria Técnica de Versión (4 Páginas)  
**Versión:** `v1.0.2` | **Fecha:** Octubre 2026 | **Distribución:** Docker Hub (`release-1.0.2`)  
**Destinatarios:** Junta Directiva, Gerencia de Operaciones y Clientes Institucionales  

---

<!-- ========================================== -->
<!-- PÁGINA 1: INTRODUCCIÓN Y PERFIL ADMINISTRADOR -->
<!-- ========================================== -->

## 📌 Página 1: Presentación General y Perfil Administrador

### 1.1. Propósito de la Plataforma
**BaiFa Logistics Platform** es una solución integral diseñada para la trazabilidad operativa, el control de inventario y la transparencia en el despacho de plantas eléctricas industriales. La versión **v1.0.2** consolida los módulos de **Accesos (Etapa 1)**, **Catálogo de Generadores (Etapa 2)**, **Puntos de Control Manuales (Etapa 3)** y la **Bitácora Histórica Inmutable (Etapa 4)**.

```
┌──────────────────────────────────────────────────────────────────────────────┐
│                    ARQUITECTURA DEL SISTEMA (VERSIÓN v1.0.2)                 │
│                                                                              │
│   [ Portal Clientes ]       [ Panel Administrador ]       [ App Operador ]   │
│            │                          │                          │           │
│            └──────────────────────────┼──────────────────────────┘           │
│                                       ▼                                      │
│                         [ Frontend Nuxt 4 + Vuetify 3 ]                      │
│                                       │ (Bearer JWT / Sanctum)               │
│                                       ▼                                      │
│                       [ Backend Laravel 12 RESTful API ]                     │
│                                       │                                      │
│                                       ▼                                      │
│                       [ Base de Datos MySQL 8.0 Inmutable ]                  │
└──────────────────────────────────────────────────────────────────────────────┘
```

### 1.2. Perfil Administrador y Operativo (`admin`, `manager`, `employee`)
Los usuarios internos disponen de un entorno de trabajo con barra de navegación lateral (*Sidebar*), panel de métricas operativas (KPIs), pipeline gráfico de unidades activas y control integral de la plataforma:

* **Métricas en Tiempo Real:** Total de generadores en almacén, en tránsito, en alcabalas y entregados.
* **Pipeline de Estados:** Visualización de embudo del flujo de despacho.
* **Gestión Centralizada:** Accesos directos a Generadores, Directorio de Clientes, Usuarios y Reportes.

![Panel de Control - Perfil Administrador](screenshots/30_admin_sidebar_dashboard.png)

> **Regla de Operación:** El personal administrativo y operativo cuenta con permisos para crear unidades, registrar clientes y certificar avances de ruta de cada generador.

---

<div style="page-break-after: always; text-align: right; font-size: 11px; color: #64748b;">
  <em>BaiFa Logistics Platform · Manual de Usuario v1.0.2 — Página 1 de 4</em>
</div>

<!-- ========================================== -->
<!-- PÁGINA 2: PERFIL CLIENTE EMPRESARIAL       -->
<!-- ========================================== -->

## 🏢 Página 2: Portal de Autogestión (Perfil Cliente)

### 2.1. Experiencia Simplificada y Aislamiento de Datos (`RN-PRT-01`)
El perfil **Cliente Empresarial (`client`)** fue concebido bajo un principio de usabilidad limpia y privacidad estricta. Al iniciar sesión, el cliente no visualiza menús laterales administrativos ni datos de otras empresas; accede de inmediato a un portal exclusivo con cabecera horizontal (*Navbar* superior).

![Portal de Clientes - Autogestión y Equipos](screenshots/31_client_horizontal_dashboard.png)

### 2.2. Funcionalidades del Portal de Clientes
1. **Cabecera Horizontal Institucional:** Enlaces directos a *Dashboard*, *Rastrear* y *Mis Generadores*, con menú desplegable de usuario para ver perfil y cerrar sesión de forma segura.
2. **Tarjeta de Bienvenida y Accesos Rápidos:** Accesos ágiles a *Mis Pedidos*, *Mi lista de compras*, *Catálogo de generadores* y *Soporte técnico*.
3. **Mis Generadores Asociados:** Tabla dedicada donde el cliente monitorea únicamente las plantas eléctricas asignadas a su cuenta corporativa, con su potencia (kVA), ubicación referencial y estado logístico.
4. **Consulta Rápida de Tracking:** Haciendo clic sobre el número de serial (ej. `GEN-2026-0041`) o sobre el botón de trazabilidad, el cliente es redirigido a la línea de tiempo en tiempo real.

### 2.3. Guía Rápida para el Cliente
* **Paso 1:** Ingrese a la plataforma con su correo y contraseña institucional.
* **Paso 2:** En la sección *Mis generadores asociados*, identifique el equipo de su interés.
* **Paso 3:** Haga clic sobre el serial para revisar las paradas y el avance de su transporte hacia su sede.

---

<div style="page-break-after: always; text-align: right; font-size: 11px; color: #64748b;">
  <em>BaiFa Logistics Platform · Manual de Usuario v1.0.2 — Página 2 de 4</em>
</div>

<!-- ========================================== -->
<!-- PÁGINA 3: CATÁLOGO Y PUNTOS DE CONTROL     -->
<!-- ========================================== -->

## ⚡ Página 3: Catálogo y Puntos de Control (Etapa 3)

### 3.1. Catálogo de Generadores Eléctricos (Etapa 2)
El sistema gestiona la ficha técnica completa de cada planta eléctrica mediante los siguientes campos:

* **Serial de Fábrica Único:** Código alfanumérico irrepetible (ej. `GEN-2026-0041`).
* **Especificaciones:** Modelo, capacidad de potencia en kVA y fotografía referencial.
* **Cliente Asignado y ETA:** Empresa receptora y fecha estimada de llegada en destino.
* **Estados Logísticos:** `En Almacén` (Violeta), `En Tránsito` (Azul), `En Punto de Control` (Amarillo), `Entregado` (Verde) e `Instalado` (Esmeralda).

### 3.2. Registro Manual de Checkpoints (Etapa 3 · `RN-TRK-01`)
La plataforma opera bajo el principio de **registro manual estricto**: los avances de ruta no dependen de dispositivos GPS con riesgo de desconexión o cobertura, sino que son reportados y avalados por el personal autorizado.

![Modal de Registro de Checkpoints y Avance de Ruta](screenshots/04_modal_actualizar_estado.png)

### 3.3. Procedimiento para Registrar un Checkpoint
1. Desde el listado de *Generadores* o la pantalla de *Rastreo*, presione el botón **Actualizar Estado / Registrar Checkpoint**.
2. **Seleccione el Nuevo Estado:** Indique la fase logística alcanzada por la unidad.
3. **Nombre del Hito Logístico:** Ingrese el punto físico alcanzado (ej. *Almacén Valencia*, *Alcabala Guacara*, *Puerto Cabello*).
4. **Fecha y Hora del Evento:** Opcional (por defecto registra la marca temporal de envío).
5. **Observaciones:** Describa la placa del transporte, transportista o incidencias de ruta.
6. Presione **Actualizar Estado**: el sistema registrará el checkpoint inmutable y sincronizará el estado principal del generador en una sola transacción segura.

---

<div style="page-break-after: always; text-align: right; font-size: 11px; color: #64748b;">
  <em>BaiFa Logistics Platform · Manual de Usuario v1.0.2 — Página 3 de 4</em>
</div>

<!-- ========================================== -->
<!-- PÁGINA 4: BITÁCORA HISTÓRICA Y TIMELINE    -->
<!-- ========================================== -->

## 📍 Página 4: Bitácora Histórica y Timeline (Etapa 4)

### 4.1. Módulo de Rastreo por Serial (`RN-PRT-02`)
Accesible para todos los perfiles (`admin`, `manager`, `employee`, `client`) a través de la ruta `/tracking`. Permite consultar al instante el estatus de cualquier equipo mediante su serial de fábrica o mediante chips de selección rápida.

![Línea de Tiempo Interactiva y Ficha Técnica](screenshots/07_rastrear_timeline_detalle.png)

### 4.2. Línea de Tiempo Cronológica e Inmutable (`RN-BIT-01`)
El módulo despliega el **Historial de Tránsito** ordenado cronológicamente con las siguientes garantías:

* **Conexión Visual Continua:** Línea vertical con puntos identificadores coloreados según el estado alcanzado en cada hito.
* **Detalle del Evento:** Nombre del punto de control (`📍 Alcabala Guacara`), fecha y hora formateada (`2026-08-30 07:30`) y observaciones del viaje.
* **Responsabilidad y Auditoría:** Cada parada indica el nombre y rol del operador (`por Adriana Morales · Administrador`).
* **Sello de Certificación:** Registro inmutable bloqueado para edición retroactiva, garantizando fidelidad ante auditorías del cliente.
* **Ficha Técnica con Fotografía:** Visualización lateral del activo y su fotografía con opción de ampliación en pantalla completa.

---

### 📋 Estado de Entregables Comerciales (Etapas 1 a 4)

| Etapa | Módulo | Alcance Demostrado y Verificado | Estado de Aprobación |
| :---: | :--- | :--- | :---: |
| **1** | **Accesos y Seguridad** | Login JWT, Registro con RIF, Roles RBAC, Usuarios y Directorio Fiscal. | ✅ **Completado (100%)** |
| **2** | **Inventario y Equipos** | Catálogo de Generadores, seriales únicos, subida de fotos y métricas. | ✅ **Completado (100%)** |
| **3** | **Puntos de Control** | Diálogo modal de checkpoints, validaciones y actualización manual. | ✅ **Completado (100%)** |
| **4** | **Bitácora Histórica** | Línea de tiempo interactiva, historial inmutable y auditoría de ruta. | ✅ **Completado (100%)** |
| **5** | **Dashboard y KPIs** | Reportes consolidados ejecutivos y exportación de datos. | ⚪ **Planificada (Próxima)** |

---

<div style="text-align: right; font-size: 11px; color: #64748b;">
  <em>BaiFa Logistics Platform · Manual de Usuario v1.0.2 — Página 4 de 4 — Fin del Documento</em>
</div>
