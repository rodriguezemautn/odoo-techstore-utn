# 📚 Guía Práctica: Configuración del Workshop Odoo
## Explicación Detallada y Uso Paso a Paso

---

## **🗂️ ESTRUCTURA DE ARCHIVOS**

Primero, vamos a entender qué archivos necesitas y dónde van:

```
odoo-techstore-utn/
├── docker-compose.yml          # ← Archivo principal (ya creado antes)
├── config/
│   └── odoo.conf               # ← Configuración de Odoo (NUEVO)
├── scripts/
│   ├── prepare_demo.sh         # ← Script de preparación (NUEVO)
│   ├── check_demo.sh           # ← Script de verificación (NUEVO)
│   └── import_demo_data.py     # ← Script de datos (NUEVO)
├── data/
│   ├── productos_techstore.csv # ← Datos de productos (NUEVO)
│   └── clientes_universitarios.csv # ← Datos de clientes (NUEVO)
├── addons/                     # ← Para módulos personalizados
├── logs/                       # ← Logs de Odoo
└── Makefile                    # ← Comandos automatizados (NUEVO)
```

---

## **📋 PASO A PASO: CONFIGURACIÓN INICIAL**

### **PASO 1: Crear la estructura básica**

```bash
# 1. Crear directorio principal
mkdir odoo-techstore-utn
cd odoo-techstore-utn

# 2. Crear subdirectorios
mkdir -p config scripts data addons logs
```

### **PASO 2: Crear el archivo de configuración de Odoo**

```bash
# Crear config/odoo.conf
cat > config/odoo.conf << 'EOF'
[options]
# Rutas donde Odoo busca módulos/aplicaciones
addons_path = /mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons

# Contraseña maestra para gestión de BD
admin_passwd = admin123

# Configuración de base de datos
db_host = db                    # Nombre del contenedor PostgreSQL
db_port = 5432                 # Puerto estándar de PostgreSQL
db_user = odoo                 # Usuario de la BD
db_password = odoo123          # Contraseña de la BD

# Filtro de bases de datos (solo muestra las que empiecen con "techstore_")
dbfilter = techstore_.*

# Habilitar datos de demostración
demo = True

# Configuración web
http_enable = True             # Habilitar interfaz web
http_interface = 0.0.0.0       # Escuchar en todas las interfaces
http_port = 8069              # Puerto web estándar de Odoo

# Configuración de memoria (optimizada para workshop)
limit_memory_hard = 2684354560    # 2.5GB límite duro
limit_memory_soft = 2147483648    # 2GB límite suave

# Configuración de logs
log_level = info              # Nivel de detalle de logs
logfile = /var/log/odoo/odoo.log  # Archivo de logs

# Configuraciones específicas para development/workshop
dev_mode = all                # Modo desarrollo (recarga automática)
without_demo = False          # Incluir datos de demo
EOF
```

**💡 ¿Qué hace cada configuración importante?**

- **`addons_path`**: Le dice a Odoo dónde buscar las aplicaciones/módulos
- **`dbfilter`**: Solo muestra bases de datos que empiecen con "techstore_" (para el workshop)
- **`demo = True`**: Incluye datos de ejemplo (productos, clientes, etc.)
- **`dev_mode = all`**: Modo desarrollo que recarga cambios automáticamente
- **`limit_memory_*`**: Límites de memoria optimizados para laptops del workshop

### **PASO 3: Crear el script de preparación**

```bash
# Crear scripts/prepare_demo.sh
cat > scripts/prepare_demo.sh << 'EOF'
#!/bin/bash

echo "🏫 Preparando Workshop TechStore Universidad - UTN FrLP"

# Crear estructura si no existe
mkdir -p {config,addons,logs,scripts,data}

# Crear archivo de configuración simplificado
cat > config/odoo.conf << 'ODOO_EOF'
[options]
addons_path = /mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons
admin_passwd = admin123
db_host = db
db_user = odoo
db_password = odoo123
dbfilter = techstore_.*
demo = True
dev_mode = all
log_level = info
ODOO_EOF

# Crear datos de productos con precios argentinos
cat > data/productos_techstore.csv << 'PRODUCTOS_EOF'
name,list_price,standard_price,categ_id/id,default_code,barcode,description
"Notebook Lenovo Legion 5 AMD",520000,420000,product.product_category_5,LENOVO-L5-AMD,7891234567890,"Notebook Gaming AMD Ryzen 7 16GB RAM RTX 3060"
"Mouse Gaming Logitech G502",35000,25000,product.product_category_5,LOG-G502,7891234567891,"Mouse Gaming con 11 botones programables"
"Mochila Notebook USB",18000,12000,product.product_category_5,MOCH-USB,7891234567892,"Mochila para notebook con puerto USB"
"Teclado Mecánico HyperX",45000,32000,product.product_category_5,HYPERX-KB,7891234567893,"Teclado mecánico RGB switches rojos"
"Monitor LG 24 4K",180000,140000,product.product_category_5,LG-24-4K,7891234567894,"Monitor 24 pulgadas 4K HDR"
PRODUCTOS_EOF

# Crear datos de clientes universitarios
cat > data/clientes_universitarios.csv << 'CLIENTES_EOF'
name,email,phone,category_id/id,student_id,career,university
"Juan Carlos Pérez","juan.perez@estudiantes.utn.edu.ar","+54 221 456-7890",base.res_partner_category_0,12345,"Ingeniería en Sistemas","UTN FrLP"
"María Fernanda González","maria.gonzalez@estudiantes.utn.edu.ar","+54 221 456-7891",base.res_partner_category_0,12346,"Ingeniería Industrial","UTN FrLP"
"Ana Sofía Rodriguez","ana.rodriguez@profesores.utn.edu.ar","+54 221 456-7893",base.res_partner_category_1,P001,"Docente Sistemas","UTN FrLP"
CLIENTES_EOF

echo "✅ Archivos de configuración creados"
echo "📊 Datos de demo preparados"
echo "🚀 Listo para ejecutar: docker-compose up -d"
EOF

# Hacer el script ejecutable
chmod +x scripts/prepare_demo.sh
```

### **PASO 4: Actualizar docker-compose.yml**

Necesitas modificar tu `docker-compose.yml` para usar la configuración personalizada:

```yaml
# docker-compose.yml (versión mejorada)
version: '3.8'

services:
  db:
    image: postgres:15
    container_name: odoo_postgres_utn
    environment:
      POSTGRES_DB: postgres
      POSTGRES_USER: odoo
      POSTGRES_PASSWORD: odoo123
      PGDATA: /var/lib/postgresql/data/pgdata
    volumes:
      - odoo-db-data:/var/lib/postgresql/data/pgdata
    ports:
      - "5432:5432"
    restart: unless-stopped

  odoo:
    image: odoo:18
    container_name: odoo_app_utn
    depends_on:
      - db
    environment:
      - HOST=db
      - USER=odoo
      - PASSWORD=odoo123
      - POSTGRES_DB=postgres
    volumes:
      - odoo-web-data:/var/lib/odoo
      - ./config/odoo.conf:/etc/odoo/odoo.conf:ro  # ← NUEVA LÍNEA
      - ./addons:/mnt/extra-addons
      - ./logs:/var/log/odoo
    ports:
      - "8069:8069"
    restart: unless-stopped
    command: ["odoo", "--config=/etc/odoo/odoo.conf", "--dev=all"]  # ← NUEVA LÍNEA

volumes:
  odoo-web-data:
  odoo-db-data:
```

### **PASO 5: Crear el Makefile (comandos automatizados)**

```bash
# Crear Makefile
cat > Makefile << 'EOF'
.PHONY: setup start stop clean logs status workshop

setup:
	@echo "🏗️ Configurando workshop TechStore Universidad"
	@./scripts/prepare_demo.sh

start:
	@echo "🚀 Iniciando Odoo..."
	@docker-compose up -d db
	@echo "⏳ Esperando PostgreSQL..."
	@sleep 15
	@docker-compose up -d odoo
	@echo "✅ Odoo iniciado en http://localhost:8069"

stop:
	@echo "🛑 Deteniendo servicios..."
	@docker-compose down

clean:
	@echo "🧹 Limpiando todo (¡CUIDADO: Borra datos!)..."
	@docker-compose down -v
	@docker system prune -f

logs:
	@echo "📋 Mostrando logs de Odoo..."
	@docker-compose logs -f odoo

status:
	@echo "📊 Verificando estado..."
	@docker-compose ps

workshop: setup start
	@echo "🎓 Workshop listo!"
	@echo "🌐 Accede a: http://localhost:8069"
	@echo "👤 Usuario: admin@techstore.utn.edu.ar"
	@echo "🔑 Password: admin123"
EOF
```

---

## **🚀 CÓMO USAR TODO ESTO**

### **Opción A: Uso Automático (Recomendado para el workshop)**

```bash
# 1. Ejecutar preparación automática
make setup

# 2. Iniciar todo el workshop
make workshop

# Eso es todo! 🎉
```

### **Opción B: Paso a paso manual**

```bash
# 1. Preparar archivos
./scripts/prepare_demo.sh

# 2. Iniciar base de datos
docker-compose up -d db

# 3. Esperar que PostgreSQL esté listo
sleep 15

# 4. Iniciar Odoo
docker-compose up -d odoo

# 5. Verificar que todo funciona
docker-compose ps
```

### **Comandos útiles durante el workshop:**

```bash
# Ver estado de contenedores
make status
# o
docker-compose ps

# Ver logs en tiempo real
make logs
# o  
docker-compose logs -f odoo

# Parar todo
make stop

# Limpiar completamente (cuidado: borra datos)
make clean
```

---

## **🔧 ¿QUÉ VENTAJAS TIENE ESTA CONFIGURACIÓN?**

### **1. Configuración Optimizada**
- **Memoria limitada**: No se comerá toda la RAM de tu laptop
- **Modo desarrollo**: Cambios se reflejan automáticamente
- **Logs detallados**: Fácil troubleshooting

### **2. Datos Preparados**
- **Productos realistas**: Precios en pesos argentinos
- **Clientes universitarios**: Nombres y emails de UTN
- **Categorías apropiadas**: Tech store específico

### **3. Automatización**
- **Un comando**: `make workshop` y listo
- **Scripts preparados**: No hay que recordar comandos largos
- **Verificación automática**: Chequea que todo funcione

### **4. Facilidad para la Demo**
- **Base de datos filtrada**: Solo muestra "techstore_*"
- **Datos de demo incluidos**: Productos y clientes ya cargados
- **Configuración específica**: Optimizada para presentación

---

## **💡 EJEMPLO PRÁCTICO PARA EL DÍA DEL WORKSHOP**


```bash
# En tu laptop, desde una carpeta nueva:
git clone [tu-repo] odoo-workshop-utn
cd odoo-workshop-utn

# Un solo comando para preparar todo:
make workshop

# Verificar que funciona:
# Abrir http://localhost:8069
# Login: admin@techstore.utn.edu.ar
# Password: admin123
```

### **Durante la clase:**

```bash
# Si algo falla, restart rápido:
make stop
make start

# Ver qué está pasando:
make logs

# Verificar estado:
make status
```

### **Después de la clase:**

```bash
# Parar servicios:
make stop

# O limpiar todo:
make clean
```

---

## **🎯 RESUMEN EJECUTIVO**

**Para usar esta configuración:**

1. **Crea los archivos** usando los scripts que te proporcioné
2. **Ejecuta `make workshop`** y espera 2-3 minutos
3. **Abre http://localhost:8069** en tu navegador
4. **Usa admin@techstore.utn.edu.ar / admin123** para entrar

✅ Master Password: (dejar vacío si deshabilitaste admin_passwd)
✅ Database Name: techstore_utn
✅ Email: admin@techstore.utn.edu.ar  
✅ Password: admin123
✅ Phone Number: +54 221 424-6600
✅ Language: Spanish (Argentina) 🇦🇷
✅ Country: Argentina 🇦🇷
✅ Demo Data: ☑️ (marcar la casilla)

5. **¡Ya tienes Odoo listo para la demo!**

🔧 PERSONALIZACIÓN PARA TU WORKSHOP
Si quieres ajustar algo específico:
Cambiar contraseñas:
```
# En config/odoo.conf
admin_passwd = tu_password_aqui
db_password = tu_db_password_aqui
```
Cambiar el filtro de BD:
```
# Para mostrar solo BD de tu universidad
dbfilter = utn_.*
```
Ajustar memoria según tu laptop:
```
# Para laptops con menos RAM (4GB):
limit_memory_hard = 1342177280    # 1.25GB
limit_memory_soft = 1073741824    # 1GB
# Para laptops potentes (16GB+):
limit_memory_hard = 4294967296    # 4GB
limit_memory_soft = 3221225472    # 3GB
```
**¿La gran ventaja?** Todo está preconfigurado específicamente para tu workshop universitario, con datos realistas argentinos y configuración optimizada para laptops.

