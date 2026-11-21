# PAAM — Despliegue con Docker

Configuración basada en el despliegue de la Plataforma de Aprendizaje para Aulas Multigrado (PAAM) en una máquina virtual de Microsoft Azure. El entorno utiliza Moodle 4.5, PHP 8.3 con Apache y MariaDB 10.11.

## Instalación de prueba local

1. Instala Docker con Docker Compose.
2. Copia `.env.example` a `.env` y define `DB_ROOT_PASSWORD` y `DB_PASSWORD` con valores propios.
3. Copia `config.php.example` a `config.php` y reemplaza `REEMPLAZAR_CON_DB_PASSWORD` por el valor de `DB_PASSWORD`.
4. Ejecuta `docker compose up -d --build`.
5. Abre `http://localhost:8080` y completa la instalación inicial de Moodle.

Esta configuración crea una instalación nueva con volúmenes vacíos. El puerto 8080 se vincula a la interfaz local. En Azure, el acceso público requiere la configuración del dominio y de HTTPS.
