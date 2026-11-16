# 🚀 Guía Definitiva de Despliegue en cPanel - BaiFa Tracking

Esta guía detalla la configuración y despliegue del sistema **BaiFa (Frontend Nuxt 3 SPA + Backend Laravel 11 API)** sobre un entorno de **cPanel compartido**, conviviendo de forma segura y aislada con una web principal en WordPress.

---

## 🌐 Esquema de Arquitectura en cPanel

- **Web Principal (WordPress):** Carpeta raíz `public_html/` (`https://www.baifa.com.ve`)
- **Subcarpeta de BaiFa:** `public_html/tracking/`
- **Subdominio de Seguimiento:** `tracking.baifa.com.ve` apuntando como Document Root a `public_html/tracking`
- **Frontend SPA (Nuxt/Vue 3):** `https://tracking.baifa.com.ve/` (Archivos ubicados directamente en `public_html/tracking/`)
- **Backend API (Laravel):** `https://tracking.baifa.com.ve/api` (Archivos ubicados en la subcarpeta `public_html/tracking/api/`)

---

## 📦 Paquetes Generados en `baifa-builds/`

| Archivo / Carpeta | Descripción |
| :--- | :--- |
| **`baifa-ui-cpanel.zip`** | **Frontend Nuxt/Vue 3** precompilado en modo SPA estático puro (HTML/CSS/JS). Incluye regla `.htaccess` que excluye `/api` para no interferir con el backend y redirige rutas SPA a `index.html`. Preconfigurado con `config.js` apuntando a `https://tracking.baifa.com.ve/api`. |
| **`baifa-api-cpanel.zip`** | **Backend Laravel 11** optimizado para **PHP 8.2 / 8.3** (dependencias Symfony y Laravel de producción en `vendor/`, `platform-check` tolerante). Incluye `.htaccess` anti-bucles para subcarpetas, `.env.production.example` con `API_PREFIX=""` y script auxiliar `storage-link-helper.php`. |
| **`database_cpanel_init.sql`** | Volcado MySQL completo con estructura de tablas, migraciones y seeders iniciales (usuarios, roles y permisos listos). |
| **`baifa-ui/`** | Directorio descomprimido del frontend para inspección directa. |
| **`baifa-api/`** | Directorio descomprimido del backend para inspección directa. |

---

## 🛠️ Paso a Paso para el Despliegue

### Paso 1: Configurar el Subdominio en cPanel
1. Inicia sesión en tu cPanel y ve a la sección **Dominios** (o **Subdominios**).
2. Crea un nuevo subdominio con los siguientes datos:
   - **Subdominio:** `tracking`
   - **Dominio:** `baifa.com.ve`
   - **Raíz del documento (Document Root):** `public_html/tracking`
3. Guarda los cambios. Esto creará la carpeta física `public_html/tracking` dentro de tu hosting.

---

### Paso 2: Base de Datos MySQL
1. En cPanel, ingresa a **Bases de Datos MySQL** (o Asistente de Bases de Datos).
2. Crea una base de datos nueva (ejemplo: `baifacom_tracking`).
3. Crea un usuario MySQL con contraseña segura (ejemplo: `baifacom_user`).
4. Asocia el usuario a la base de datos marcando **TODOS LOS PRIVILEGIOS**.
5. Ve a **phpMyAdmin**, haz clic sobre la base de datos recién creada y dirígete a la pestaña **Importar**.
6. Selecciona el archivo **`database_cpanel_init.sql`** y presiona **Importar**.

---

### Paso 3: Desplegar el Frontend (`baifa-ui-cpanel.zip`)
1. Abre el **Administrador de Archivos** de cPanel (o tu cliente FTP favorito como FileZilla).
2. Navega hasta la carpeta: `public_html/tracking/`
3. Sube el archivo **`baifa-ui-cpanel.zip`**.
4. Haz clic derecho sobre el archivo y selecciona **Extract** (Descomprimir) directamente en `public_html/tracking/`.
5. Comprueba que en la raíz de `public_html/tracking/` se encuentren:
   - `index.html`
   - `200.html`
   - `404.html`
   - `config.js`
   - `.htaccess` (asegúrate de tener activada la opción de ver archivos ocultos en cPanel)
   - Carpeta `_nuxt/` y rutas estáticas (`login/`, `tracking/`, etc.)
6. Verifica que en `config.js` la propiedad `apiBase` sea:
   ```javascript
   window.__BAIFA_CONFIG__ = {
     apiBase: 'https://tracking.baifa.com.ve/api'
   };
   ```

---

### Paso 4: Desplegar el Backend API (`baifa-api-cpanel.zip`)
1. Dentro de `public_html/tracking/`, crea una nueva carpeta llamada **`api`** (si aún no existe).
2. Entra a `public_html/tracking/api/`.
3. Sube el archivo **`baifa-api-cpanel.zip`** dentro de esa carpeta `api/`.
4. Haz clic derecho y selecciona **Extract** para descomprimirlo dentro de `public_html/tracking/api/`.
5. Estructura resultante en `public_html/tracking/api/`:
   - `app/`
   - `bootstrap/`
   - `config/`
   - `database/`
   - `public/`
   - `resources/`
   - `routes/`
   - `storage/`
   - `vendor/`
   - `.htaccess`
   - `.env.production.example`

---

### Paso 5: Configurar el archivo `.env` del Backend
1. Dentro de `public_html/tracking/api/`, renombra el archivo `.env.production.example` a **`.env`**.
2. Edita el archivo `.env` y coloca los datos reales de tu base de datos y credenciales:
   ```env
   APP_NAME="BaiFa Tracking"
   APP_ENV=production
   APP_KEY=base64:tdjPKww/y1VnEgw6gl7B7oMEmG4QrQPnZFn5Bjwducc=
   APP_DEBUG=false
   APP_URL=https://tracking.baifa.com.ve/api
   FRONTEND_URL=https://tracking.baifa.com.ve

   # IMPORTANTE: Al estar en subcarpeta /api, dejar API_PREFIX vacío
   API_PREFIX=""

   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=tu_cpanel_db
   DB_USERNAME=tu_cpanel_user
   DB_PASSWORD="tu_password_db"

   SESSION_DRIVER=database
   CACHE_STORE=database
   FILESYSTEM_DISK=public

   # Configuración SMTP institucional
   MAIL_MAILER=smtp
   MAIL_HOST=baifa.com.ve
   MAIL_PORT=465
   MAIL_USERNAME=no-reply@baifa.com.ve
   MAIL_PASSWORD="tu_password_correo"
   MAIL_ENCRYPTION=ssl
   MAIL_FROM_ADDRESS="no-reply@baifa.com.ve"
   MAIL_FROM_NAME="BaiFa Power"
   ```
3. Guarda el archivo.

---

### Paso 6: Permisos de Carpetas y Enlace Simbólico (Storage)
1. **Permisos de escritura:** En cPanel File Manager, verifica que las siguientes carpetas dentro de `public_html/tracking/api/` tengan permisos **755** (o 775 si el grupo lo requiere):
   - `storage/` (y todas sus subcarpetas: `storage/framework/`, `storage/logs/`, `storage/app/`)
   - `bootstrap/cache/`
2. **Generar enlace de almacenamiento (`storage:link`):**
   - Si tu plan de cPanel cuenta con **Terminal SSH**, entra y ejecuta:
     ```bash
     cd public_html/tracking/api
     php artisan storage:link
     ```
   - Si **no dispones de terminal SSH**, simplemente abre en tu navegador:
     ```
     https://tracking.baifa.com.ve/api/storage-link-helper.php
     ```
     El script creará automáticamente el enlace simbólico `api/public/storage` apuntando a `api/storage/app/public`.
   - **Por seguridad**, elimina el archivo `storage-link-helper.php` de la carpeta `api/public/` una vez ejecutado.

---

### Paso 7: Configuración de PHP y Certificado SSL
1. **Versión de PHP:**
   - En cPanel, dirígete a **Administrador MultiPHP** (MultiPHP Manager) o **Seleccionar Versión de PHP**.
   - Asigna a `tracking.baifa.com.ve` la versión **PHP 8.2** o **PHP 8.3**.
   - Verifica que las extensiones requeridas estén activas: `pdo_mysql`, `mbstring`, `openssl`, `tokenizer`, `xml`, `ctype`, `json`, `bcmath`, `fileinfo`.
2. **Certificado SSL (HTTPS):**
   - En cPanel, ingresa a **SSL/TLS Status**.
   - Selecciona `tracking.baifa.com.ve` y presiona **Run AutoSSL** para emitir el certificado SSL gratuito.

---

## 👥 Cuentas de Acceso Iniciales

| Rol | Correo Electrónico | Contraseña Inicial |
| :--- | :--- | :--- |
| **Superadministrador** | `admin@baifa.com.ve` | `12345678` |
| **Administrador Alterno** | `admin@admin` | `12345678` |
| **Gerente Operativo** | `gerente@baifa.com.ve` | `12345678` |
| **Operador de Campo** | `operador@baifa.com.ve` | `12345678` |
| **Cliente Demo** | `cliente.real@empresa.com` | `12345678` |

> [!IMPORTANT]
> Cambia estas contraseñas inmediatamente desde el módulo de Usuarios tras iniciar sesión en producción.

---

## 🩺 Pruebas de Funcionamiento

1. **Prueba de Salud de la API:**
   Abre en tu navegador:
   ```
   https://tracking.baifa.com.ve/api/v1/health
   ```
   Deberás recibir una respuesta JSON:
   ```json
   {
     "status": "ok",
     "app": "baifa-api",
     "database": "connected",
     "timestamp": "..."
   }
   ```
2. **Prueba del Frontend:**
   Abre en tu navegador:
   ```
   https://tracking.baifa.com.ve/login
   ```
   Inicia sesión con `admin@baifa.com.ve` y `12345678`.

---

## ❓ Preguntas Frecuentes y Diagnóstico

### 1. ¿Por qué el frontend y el backend pueden convivir en `public_html/tracking` sin interferir?
El archivo `.htaccess` del frontend en la raíz de `tracking/` contiene la directiva especial:
```apache
RewriteRule ^api(/.*)?$ - [L]
```
Esto le indica a Apache que no capture las peticiones que comiencen por `/api` para la SPA de Vue, permitiendo que pasen limpiamente a la carpeta física `api/` gobernada por Laravel.

### 2. ¿Por qué `API_PREFIX=""` en el `.env`?
Cuando Apache entra a una subcarpeta `/api/`, Symfony detecta `/api` como el `baseUrl` del servidor. Al definir `API_PREFIX=""`, las rutas de Laravel responden tanto a `/api/v1/...` como a `/v1/...` sin arrojar error 404.

### 3. Error "500 Internal Server Error" en la API:
- Verifica que el archivo `.env` exista en `public_html/tracking/api/` y contenga las credenciales correctas de MySQL.
- Verifica permisos 755 en `storage/` y `bootstrap/cache/`.
- Consulta el registro de fallos en `public_html/tracking/api/storage/logs/laravel.log`.
