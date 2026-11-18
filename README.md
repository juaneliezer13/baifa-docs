# ⚡ BaiFa Docs — Repositorio Central de Documentación y Activos (`baifa-docs`)

Bienvenido al repositorio central de **documentación técnica, reglas de negocio, historial de versiones, guías de despliegue, especificación OpenAPI y prototipos** del ecosistema **BaiFa Power Tracking** (Sistema Web de Rastreo Logístico y Gestión Técnica de Generadores Eléctricos Industriales).

---

## 🗂️ Estructura Estandarizada del Repositorio `baifa-docs`

```text
baifa-docs/
├── 📄 README.md                                  # Índice maestro del repositorio y arquitectura general
├── 📜 NORMAS_TECNICAS.md                         # Normas técnicas, reglas de negocio y directrices para IA
├── 🤖 AGENTS.md                                  # Contexto e instrucciones operativas para Agentes de IA
├── 🤖 CLAUDE.md                                  # Contexto técnico para Claude Code / Anthropic
├── 🤖 GEMINI.md                                  # Contexto técnico para Gemini / Antigravity
│
├── 📋 api-spec/                                  # Especificaciones de la API RESTful
│   └── openapi.yaml                              # Documentación OpenAPI 3.1 completa en español (v1.0.8)
│
├── 💼 business/                                  # Documentación comercial, reglas de negocio y diseño UI/UX
│   ├── Propuesta Comercial Proyecto BaiFa.pdf    # Propuesta comercial oficial aprobada
│   ├── Presupuesto_Desarrollo_BaiFa.pdf          # Presupuesto y desglose financiero por etapas
│   ├── Planificacion Aceptada por el cliente.png # Cronograma de hitos aceptado
│   ├── business_rules_backend.md                 # Libro de reglas de negocio del Backend (Laravel 12)
│   ├── business_rules_frontend.md                # Libro de reglas de negocio del Frontend (Nuxt 4 / Vuetify 3)
│   └── diseno_figma.md                           # Especificación UI/UX, paleta de colores y vistas de Figma
│
├── 🚀 deploy/                                    # Guías DevOps, Docker Compose y configuración de servidores
│   ├── DEPLOY_AWS_EC2_BACKEND.md                 # Guía de compilación y despliegue del Backend en AWS EC2
│   ├── DEPLOY_AWS_EC2_FRONTEND.md                # Guía de compilación y despliegue del Frontend en AWS EC2
│   ├── GUIA_MIGRACION_PUERTOS_Y_DOMINIOS_AWS.md  # Guía de dominios y puertos en servidor EC2
│   ├── DEPLOY_CPANEL.md                          # Guía de despliegue alternativo en hosting cPanel
│   ├── database_cpanel_init.sql                  # Volcado SQL de referencia (estructura y seeders iniciales)
│   ├── docker-compose.ec2.yml                    # Compose unificado para orquestación en producción EC2
│   └── access_baifa_dev.pem                      # Clave privada SSH para instancia EC2 (permisos 0400)
│
├── 🏷️ releases/                                  # Historial completo de versiones y notas de lanzamiento
│   ├── README.md                                 # Matriz centralizada de versiones (Frontend + Backend API)
│   ├── RELEASE_NOTES_v1.0.1.md                   # Etapa 1 y 2: Auth Sanctum, Clientes y Catálogo de Generadores
│   ├── RELEASE_NOTES_v1.0.2.md                   # Etapa 3 y 4: Puntos de Control (Checkpoints) y Timeline
│   ├── RELEASE_NOTES_v1.0.3.md                   # Notificaciones por correo y consulta pública estilo MRW
│   ├── RELEASE_NOTES_v1.0.4.md                   # Consolidación de URLs de notificaciones y contenedores
│   ├── RELEASE_NOTES_v1.0.5.md                   # Estandarización de API Base, rastreo público y despliegue
│   ├── RELEASE_NOTES_v1.0.6.md                   # Estandarización de puertos locales, limpieza y workspace
│   ├── RELEASE_NOTES_v1.0.7.md                   # Eliminación de data dummy y validaciones integrales de formularios
│   └── RELEASE_NOTES_v1.0.8.md                   # Etapa 5 (Reportes/Portal), 7 estados logísticos, logos BaiFa®, rol Empleado y Mi Perfil
│
├── 📊 informes/                                  # Informes formales de avance y entregas de etapa
│   ├── INFORME_ENTREGA_ETAPA_1.md                # Resumen de entregables y validaciones de Etapa 1
│   ├── INFORME_PROYECTO_ETAPA_1.md               # Informe técnico en Markdown de Etapa 1
│   ├── INFORME_PROYECTO_ETAPA_1.pdf              # Informe ejecutivo oficial en PDF de Etapa 1
│   ├── INFORME_USUARIO_VERSION_1.0.2.md          # Manual e informe de usuario versión 1.0.2
│   ├── INFORME_USUARIO_VERSION_1.0.2.pdf         # Informe de usuario versión 1.0.2 en PDF
│   ├── INFORME_ENTREGA_ETAPAS_1_A_4_BAIFA.pdf    # Informe consolidado de entrega Etapas 1 a 4
│   ├── INFORME_ENTREGA_FINAL_ETAPA_5_v1.0.8.md   # Informe ejecutivo de entrega final Etapa 5 y v1.0.8
│   ├── INFORME_ENTREGA_FINAL_ETAPA_5_v1.0.8.pdf  # Informe ejecutivo de entrega final Etapa 5 y v1.0.8 en PDF
│   ├── INFORME_MEJORAS_Y_EVOLUCION_BAIFA.md      # Propuesta concisa de mejoras y nuevas funcionalidades
│   └── INFORME_MEJORAS_Y_EVOLUCION_BAIFA.pdf     # Propuesta concisa de mejoras y nuevas funcionalidades en PDF
│
└── 🖼️ prototypes-and-screenshots/                # Acervo visual de capturas, prototipos y diseño Figma
    ├── 01_dashboard.png hasta 44_*.png           # Capturas paso a paso de cada vista, flujo y modal
    ├── baifa_website.png                         # Referencia visual institucional de BaiFa Power
    ├── baifa_figma_research.json                 # Mapeo estructural de componentes Figma
    └── design_extracted.json                     # Tokens de diseño extraídos
```

---

## 🏗️ Arquitectura General del Proyecto BaiFa Power Tracking

El ecosistema completo en el entorno de trabajo (`baifa/`) opera bajo una arquitectura de contenedores Docker desacoplados:

```text
baifa/
├── ⚡ baifa.code-workspace   # Configuración de Workspace con identidad cromática BaiFa
├── 🛠️ baifa-api/             # Backend RESTful API (Laravel 12 + PHP 8.4-FPM + Nginx) -> Puerto 14001
│                             # Base de Datos MySQL 8.0 (baifa_api_db)                 -> Puerto 14002
├── 💻 baifa-ui/              # Frontend Web App (Nuxt 4 + Vue 3 + Vuetify 3 + Tailwind)-> Puerto 15001
└── 📚 baifa-docs/            # Repositorio central de documentación y activos (este repo)
```

### Mapa de Puertos en Entorno Local

| Servicio | Contenedor Docker | Puerto Interno | Puerto Host (Local) | URL Local |
| :--- | :--- | :---: | :---: | :--- |
| **Backend API (`baifa-api`)** | `baifa_api_webserver` | `80` | **`14001`** | `http://localhost:14001/api/v1/health` |
| **Base de Datos MySQL 8.0** | `baifa_api_db` | `3306` | **`14002`** | `mysql://baifa_user:secret@127.0.0.1:14002/baifa_api` |
| **Frontend Web (`baifa-ui`)** | `baifa-ui` | `3000` | **`15001`** | `http://localhost:15001` |

---

## 🎯 Resumen de Etapas del Proyecto (`release/v1.0.8`)

| Etapa | Módulo Principal | Alcance | Estado |
| :---: | :--- | :--- | :---: |
| **1** | **Accesos y Gestión de Identidades** | Autenticación Sanctum, Roles (RBAC), Registro atómico con RIF y Razón Social, Módulo de Usuarios y Directorio Fiscal de Clientes. | ✅ **Completado (100%)** |
| **2** | **Catálogo de Generadores Eléctricos** | Ficha técnica (kVA, motor diésel), inventario por serial único y registro fotográfico. | ✅ **Completado (100%)** |
| **3** | **Trazabilidad y Checkpoints (Tracking)** | Pipeline de tracking manual con línea de tiempo y consulta pública/privada estilo MRW. | ✅ **Completado (100%)** |
| **4** | **Bitácora Histórica y Notificaciones** | Historial cronológico inmutable de eventos y correos transaccionales automáticos. | ✅ **Completado (100%)** |
| **5** | **Dashboard de Clientes y Reportes** | Portal personalizado para clientes, métricas ejecutivas y reportes filtrables con exportación CSV. | ✅ **Completado (100%)** |

---

## 🏷️ Estándar de Versionado Semántico y Ramas

* **Ramas y Tags de Lanzamiento en Git/GitHub:** `release/vX.Y.Z` (última versión activa: `release/v1.0.8`).
* **Tags de Imágenes en Docker Hub:** `release-X.Y.Z` (`juaneliezer13/baifa-api:release-1.0.8` y `juaneliezer13/baifa-ui:release-1.0.8`).
* **Rama de Desarrollo Activo:** `develop`.
* **Rama de Producción Estable:** `main`.
