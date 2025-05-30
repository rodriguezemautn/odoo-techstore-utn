# 🚀 Subir Workshop Odoo UTN-FrLP a GitHub
## Guía Paso a Paso

---

## **📁 ESTRUCTURA FINAL DEL REPOSITORIO**

```
odoo-workshop-utn-frlp/
├── README.md                           # ← Documentación principal
├── .gitignore                          # ← Archivos a ignorar
├── docker-compose.yml                  # ← Configuración Docker
├── LICENSE                             # ← Licencia del proyecto
├── config/
│   └── odoo.conf                      # ← Configuración Odoo
├── scripts/
│   ├── prepare_demo.sh                # ← Script preparación
│   ├── check_demo.sh                  # ← Script verificación
│   └── import_demo_data.py            # ← Script datos demo
├── data/
│   ├── productos_techstore.csv        # ← Productos demo
│   └── clientes_universitarios.csv    # ← Clientes demo
├── docs/
│   ├── slides/                        # ← Presentación
│   ├── troubleshooting.md             # ← Guía problemas
│   └── workshop-guide.md              # ← Guía del workshop
├── addons/                            # ← Módulos personalizados (vacío)
└── Makefile                           # ← Comandos automatizados
```

---

## **🔧 PASO 1: PREPARAR ARCHIVOS PARA GIT**

### **Crear .gitignore**
```bash
cat > .gitignore << 'EOF'
# Logs
logs/
*.log

# Datos de Docker
volumes/

# Archivos temporales de Odoo
filestore/
sessions/

# Archivos de sistema
.DS_Store
Thumbs.db

# Archivos de entornos virtuales
venv/
env/
.env

# Cache de Python
__pycache__/
*.pyc
*.pyo

# Configuraciones locales
.local/

# Archivos de backup
*.backup
*.dump

# Datos sensibles (si los hubiera)
secrets/
EOF
```

### **Crear README.md completo**
```bash
cat > README.md << 'EOF'
# 🎓 Workshop Odoo ERP - UTN Facultad Regional La Plata

Workshop completo sobre **Odoo 18** para la cátedra de "Tecnologías de Información para la Gestión Empresarial" de la carrera de Ingeniería en Sistemas de Información.

## 📋 Descripción

Este repositorio contiene todo el material necesario para realizar un workshop de 50 minutos sobre **Odoo ERP Open Source**, incluyendo:

- 🎯 Presentación completa (22 slides)
- 🐳 Setup con Docker listo para usar
- 💻 Demo en vivo del caso "TechStore Universidad" 
- 📊 Datos de prueba realistas para Argentina
- 🛠️ Scripts de automatización
- 📚 Documentación completa

## 🚀 Inicio Rápido

### Prerrequisitos
- Docker Desktop instalado
- 8GB RAM disponible
- Conexión a internet

### Instalación y Ejecución
```bash
# 1. Clonar repositorio
git clone https://github.com/[tu-usuario]/odoo-workshop-utn-frlp.git
cd odoo-workshop-utn-frlp

# 2. Preparar y ejecutar workshop
make workshop

# 3. Acceder a Odoo
# URL: http://localhost:8069
# Usuario: admin@techstore.utn.edu.ar
# Password: admin123
```

## 📖 Contenido del Workshop

### 🎯 **Objetivos de Aprendizaje**
- Entender qué es un ERP y su evolución histórica
- Conocer las características únicas de Odoo
- Realizar una implementación completa en vivo
- Explorar oportunidades profesionales en el mercado argentino

### 📚 **Temario (50 minutos)**
1. **Contexto ERP** (8 min) - Historia y problemática empresarial
2. **Odoo Overview** (7 min) - Propuesta de valor y diferenciación
3. **Demo en Vivo** (20 min) - Implementación caso "TechStore Universidad"
4. **Oportunidades** (12 min) - Carreras, certificaciones y comunidad
5. **Q&A** (3 min) - Preguntas y próximos pasos

### 🏪 **Caso Práctico: TechStore Universidad**
Tienda de tecnología que vende equipos informáticos a estudiantes universitarios.

**Módulos demostrados:**
- 📊 **CRM**: Gestión de leads y oportunidades
- 💰 **Ventas**: Proceso completo cotización → factura → cobro
- 📦 **Inventario**: Control de stock y movimientos
- 📋 **Contabilidad**: Localización argentina con AFIP

## 📁 Estructura del Proyecto

```
├── config/odoo.conf           # Configuración optimizada para workshop
├── docker-compose.yml         # Stack completo PostgreSQL + Odoo 18
├── scripts/                   # Scripts de automatización
├── data/                      # Datos de demo (productos/clientes)
├── docs/                      # Documentación y slides
└── Makefile                   # Comandos útiles
```

## 🛠️ Comandos Útiles

```bash
make setup      # Preparar archivos de configuración
make start      # Iniciar Odoo y PostgreSQL
make stop       # Detener servicios
make clean      # Limpiar todo (¡cuidado: borra datos!)
make logs       # Ver logs en tiempo real
make status     # Verificar estado de contenedores
```

## 🎯 Datos de Demo

### Productos Incluidos
- Notebooks gaming y desarrollo
- Periféricos (mouse, teclados, webcams)
- Componentes (RAM, SSD, monitores)
- Accesorios universitarios

### Clientes Preconfigurados
- Estudiantes de diferentes carreras UTN
- Profesores y personal académico
- Precios en pesos argentinos

## 🚨 Troubleshooting

### Problemas Comunes

**Docker no inicia:**
```bash
sudo systemctl start docker  # Linux
# O abrir Docker Desktop manualmente
```

**Puerto ocupado:**
```bash
sudo lsof -i :8069
sudo kill -9 [PID]
```

**Reinicio completo:**
```bash
make clean
make workshop
```

Ver [docs/troubleshooting.md](docs/troubleshooting.md) para más detalles.

## 🎓 Recursos de Aprendizaje

### Documentación Oficial
- [Odoo Documentation](https://www.odoo.com/documentation/18.0/)
- [Developer Tutorial](https://www.odoo.com/documentation/18.0/developer.html)
- [Functional Documentation](https://www.odoo.com/documentation/18.0/applications.html)

### Comunidad Argentina
- 📱 [Telegram Odoo Argentina](https://t.me/odoo_argentina)
- 💼 [LinkedIn Odoo Professionals LATAM](https://www.linkedin.com/groups/...)
- 🐙 [GitHub OCA](https://github.com/OCA)

### Certificaciones
- 🟢 [Functional Consultant](https://www.odoo.com/certification) - €350
- 🔵 [Developer Certification](https://www.odoo.com/certification) - €450
- 🟣 [Implementation Specialist](https://www.odoo.com/certification) - €650

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si quieres mejorar el workshop:

1. Fork del repositorio
2. Crear rama feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit cambios (`git commit -am 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crear Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver [LICENSE](LICENSE) para detalles.

## 👤 Autor

**Emanuel Rodriguez**
- Email: emanuel.rodriguez@frp.utn.edu.ar
- LinkedIn: [Emanuel Rodriguez](https://linkedin.com/in/emanuel-rodriguez-odoo)
- GitHub: [@emanuel-odoo-utn](https://github.com/emanuel-odoo-utn)

## 🏫 Universidad

**Universidad Tecnológica Nacional - Facultad Regional La Plata**
- Cátedra: Tecnologías de Información para la Gestión Empresarial
- Carrera: Ingeniería en Sistemas de Información
- Profesor: Mg. Leandro Rocca

## 🙏 Agradecimientos

- [Odoo SA](https://www.odoo.com) por crear una plataforma increíble
- [Adhoc SA](https://www.adhoc.com.ar) por la localización argentina
- Comunidad Odoo Argentina por el apoyo constante
- UTN-FrLP por el espacio académico

---

⭐ **¡Si este workshop te resultó útil, dale una estrella al repo!** ⭐
EOF
```

### **Crear LICENSE**
```bash
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2025 Emanuel Rodriguez - UTN Facultad Regional La Plata

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
```

---

## **🐙 PASO 2: INICIALIZAR GIT Y SUBIR A GITHUB**

### **Inicializar repositorio local**
```bash
# 1. Inicializar Git
git init

# 2. Agregar todos los archivos
git add .

# 3. Primer commit
git commit -m "🎓 Initial commit: Odoo Workshop UTN-FrLP

- Complete workshop setup with Docker
- 22-slide presentation included
- TechStore Universidad demo case
- Argentine localization ready
- Automated scripts for easy setup"
```

### **Crear repositorio en GitHub**

1. **Ir a GitHub.com** y hacer login
2. **Click en "+" → "New repository"**
3. **Configurar:**
   - Repository name: `odoo-workshop-utn-frlp`
   - Description: `Workshop completo Odoo ERP para UTN-FrLP - Cátedra Tecnologías de Información`
   - ✅ Public (para que otros puedan usarlo)
   - ❌ Add a README file (ya lo tenemos)
   - ❌ Add .gitignore (ya lo tenemos)
   - ✅ Choose a license: MIT License

4. **Click "Create repository"**

### **Conectar y subir**
```bash
# 1. Agregar remote origin (cambiar [tu-usuario] por tu username de GitHub)
git remote add origin https://github.com/[tu-usuario]/odoo-workshop-utn-frlp.git

# 2. Cambiar nombre de rama a main (estándar actual)
git branch -M main

# 3. Subir todo
git push -u origin main
```

---

## **🏷️ PASO 3: CREAR RELEASES Y TAGS**

### **Crear primera release**
```bash
# 1. Crear tag para la versión
git tag -a v1.0.0 -m "🚀 Release v1.0.0 - Workshop Complete

✨ Features:
- Complete Odoo 18 workshop setup
- Docker-based environment
- Argentine demo data
- Automated scripts
- Comprehensive documentation

🎯 Workshop ready for UTN-FrLP presentation"

# 2. Subir tag
git push origin v1.0.0
```

### **Crear release en GitHub**
1. **Ir a tu repo en GitHub**
2. **Click en "Releases" → "Create a new release"**
3. **Configurar:**
   - Tag version: `v1.0.0`
   - Release title: `🎓 Workshop Odoo UTN-FrLP v1.0.0`
   - Description:
   ```markdown
   ## 🎯 Workshop Completo Odoo ERP para UTN-FrLP
   
   Primera versión estable del workshop de Odoo para la cátedra de Tecnologías de Información.
   
   ### ✨ Características
   - ✅ Setup completo con Docker
   - ✅ Presentación de 22 slides
   - ✅ Demo caso "TechStore Universidad"
   - ✅ Datos argentinos realistas
   - ✅ Scripts de automatización
   - ✅ Documentación completa
   
   ### 🚀 Uso Rápido
   ```bash
   git clone https://github.com/[tu-usuario]/odoo-workshop-utn-frlp.git
   cd odoo-workshop-utn-frlp
   make workshop
   ```
   
   ### 🎓 Para Educadores
   Todo listo para usar en aula. Duración: 50 minutos.
   ```
4. **Click "Publish release"**

---

## **📢 PASO 4: PROMOCIÓN Y COMPARTICIÓN**

### **Crear badges para el README**
Agregar al inicio del README.md:
```markdown
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Odoo Version](https://img.shields.io/badge/Odoo-18.0-purple.svg)](https://www.odoo.com)
[![Docker](https://img.shields.io/badge/Docker-Compose-blue.svg)](https://docs.docker.com/compose/)
[![University](https://img.shields.io/badge/UTN-FrLP-green.svg)](https://www.frlp.utn.edu.ar)
```

### **Compartir en comunidades**
```markdown
# Mensaje para Telegram Odoo Argentina:
🎓 ¡Nuevo workshop de Odoo para universidades!

Acabo de subir a GitHub un workshop completo de Odoo ERP diseñado para estudiantes de ingeniería:

🔗 https://github.com/[tu-usuario]/odoo-workshop-utn-frlp

✨ Incluye:
- Setup con Docker (5 minutos)
- Demo completa caso argentino
- Datos realistas en pesos
- Scripts automatizados
- Documentación completa

¡Ideal para profesores que quieran usar Odoo en sus clases! 🚀

#Odoo #Universidad #Argentina #OpenSource
```

---

## **🔧 COMANDOS FINALES PARA VERIFICAR**

```bash
# Verificar remote
git remote -v

# Ver status
git status

# Ver historial
git log --oneline

# Verificar tags
git tag -l
```

---

## **📋 CHECKLIST FINAL**

- [ ] ✅ Repositorio creado en GitHub
- [ ] ✅ Código subido correctamente
- [ ] ✅ README.md completo y atractivo
- [ ] ✅ .gitignore configurado
- [ ] ✅ LICENSE incluido
- [ ] ✅ Release v1.0.0 creada
- [ ] ✅ Badges agregados
- [ ] ✅ Documentación verificada
- [ ] ✅ Links funcionando
- [ ] ✅ Compartido en comunidades

---

**🎉 ¡Listo! Tu workshop de Odoo ya está en GitHub y disponible para toda la comunidad educativa.**

URL final: `https://github.com/[tu-usuario]/odoo-workshop-utn-frlp`