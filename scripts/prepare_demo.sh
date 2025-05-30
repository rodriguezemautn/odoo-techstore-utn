# scripts/prepare_demo.sh
#!/bin/bash

echo "🏫 Preparando Workshop TechStore Universidad - UTN FrLP"

# Crear estructura necesaria
mkdir -p {config,addons,logs,scripts,data}

# Crear archivo de configuración de Odoo
cat > config/odoo.conf << 'EOF'
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
EOF

# Crear datos de productos para importar
cat > data/productos_techstore.csv << 'EOF'
name,list_price,standard_price,categ_id/id,default_code,barcode,description
"Notebook Lenovo Legion 5 AMD",520000,420000,product.product_category_5,LENOVO-L5-AMD,7891234567890,"Notebook Gaming AMD Ryzen 7 16GB RAM RTX 3060"
"Mouse Gaming Logitech G502",35000,25000,product.product_category_5,LOG-G502,7891234567891,"Mouse Gaming con 11 botones programables"
"Mochila Notebook USB",18000,12000,product.product_category_5,MOCH-USB,7891234567892,"Mochila para notebook con puerto USB"
"Teclado Mecánico HyperX",45000,32000,product.product_category_5,HYPERX-KB,7891234567893,"Teclado mecánico RGB switches rojos"
"Monitor LG 24 4K",180000,140000,product.product_category_5,LG-24-4K,7891234567894,"Monitor 24 pulgadas 4K HDR"
"Webcam Logitech C920",25000,18000,product.product_category_5,LOG-C920,7891234567895,"Webcam HD 1080p para streaming"
"Auriculares Sony WH-1000XM4",95000,75000,product.product_category_5,SONY-WH1000,7891234567896,"Auriculares inalámbricos con cancelación de ruido"
"SSD Samsung 1TB",45000,35000,product.product_category_5,SAMSUNG-SSD1TB,7891234567897,"Disco SSD NVMe 1TB alta velocidad"
"RAM DDR4 16GB Corsair",28000,22000,product.product_category_5,CORSAIR-16GB,7891234567898,"Memoria RAM DDR4 16GB 3200MHz"
"Router WiFi 6 TP-Link",35000,25000,product.product_category_5,TPL-WIFI6,7891234567899,"Router WiFi 6 AX1800 dual band"
EOF

# Crear datos de clientes universitarios
cat > data/clientes_universitarios.csv << 'EOF'
name,email,phone,category_id/id,student_id,career,university
"Juan Carlos Pérez","juan.perez@estudiantes.utn.edu.ar","+54 221 456-7890",base.res_partner_category_0,12345,"Ingeniería en Sistemas","UTN FrLP"
"María Fernanda González","maria.gonzalez@estudiantes.utn.edu.ar","+54 221 456-7891",base.res_partner_category_0,12346,"Ingeniería Industrial","UTN FrLP"
"Carlos Alberto Martínez","carlos.martinez@estudiantes.utn.edu.ar","+54 221 456-7892",base.res_partner_category_0,12347,"Ingeniería Electrónica","UTN FrLP"
"Ana Sofía Rodriguez","ana.rodriguez@profesores.utn.edu.ar","+54 221 456-7893",base.res_partner_category_1,P001,"Docente Sistemas","UTN FrLP"
"Roberto Daniel Silva","roberto.silva@estudiantes.utn.edu.ar","+54 221 456-7894",base.res_partner_category_0,12348,"Ingeniería Mecánica","UTN FrLP"
EOF

echo "✅ Archivos de configuración creados"
echo "📊 Datos de demo preparados"
echo "🚀 Listo para ejecutar: docker-compose up -d"
