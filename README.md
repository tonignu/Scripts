# 🛠️ System Admin & Automation Toolbox

Una colección personal de scripts para la automatización de tareas en entornos **Linux (Bash)** y **Windows (PowerShell)**. Este repositorio centraliza herramientas de gestión de usuarios, backups y mantenimiento de sistemas.

## 📁 Estructura del Repositorio

| Script | Plataforma | Descripción |
| :--- | :--- | :--- |
| `add-users.ps1` | 🪟 PowerShell | Creación masiva de usuarios locales en Windows a partir de un archivo `.csv`. |
| `backup-linux.sh` | 🐧 Bash | Backup automatizado con rotación de archivos (mantiene solo los últimos 7 días). |
| `check-services.ps1` | 🪟 PowerShell | Verifica el estado de una lista de servicios críticos y los reinicia si están caídos. |
| `monitor-disk.ps1` | 🪟 PowerShell | Monitorea el espacio en disco y genera una alerta visual si el espacio libre es inferior al 10%. |
| `rotate-logs.sh` | 🐧 Bash | Rotación manual de Logs para evitar que los archivos .log llenen el disco |

## 🚀 Ejemplos de ejecución

### 1. Creación masiva de usuarios (Windows)
El script `add-users.ps1` lee un archivo CSV con columnas `username,password,group` y configura las cuentas automáticamente.
- **Uso:** 
  ```powershell
  .\add-users.ps1 -csvPath "usuarios.csv"

### 2. Backup automatizado con rotación (Linux)
backup-linux.sh realiza una copia comprimida de los directorios seleccionados y elimina los backups más antiguos de X días para ahorrar espacio.

- **Configuración:** Edita las variables SOURCE_DIR y RETENTION_DAYS dentro del script.
- **Uso:** 
  ```bash
  ./backup-linux.sh

## ⚙️ Requisitos y Configuración

### PowerShell (Windows)
Para ejecutar scripts descargados, abre PowerShell como administrador y activa la política de ejecución:
- **Uso:** 
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

### Bash (Linux)
- **Uso:**
  ```bash
  chmod +x *.sh

## 📝 Notas de Uso

- **Seguridad:** Los scripts que manejan contraseñas (como el de creación de usuarios) deben tratarse con precaución. No subas archivos CSV con datos reales al repositorio.
- **Logs:** La mayoría de los scripts generan un archivo .log en la misma carpeta para auditar errores.

