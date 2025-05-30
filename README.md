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
git clone https://github.com/rodriguezemautn/odoo-workshop-utn-frlp.git
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

## �� Recursos de Aprendizaje

### Documentación Oficial
- [Odoo Documentation](https://www.odoo.com/documentation/18.0/)
- [Developer Tutorial](https://www.odoo.com/documentation/18.0/developer.html)
- [Functional Documentation](https://www.odoo.com/documentation/18.0/applications.html)


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
- GitHub: [@emanuel-odoo-utn](https://github.com/rodriguezemautn)

## 🏫 Universidad

**Universidad Tecnológica Nacional - Facultad Regional La Plata**
- Cátedra: Tecnologías de Información para la Gestión Empresarial
- Carrera: Ingeniería en Sistemas de Información
- Profesor: Mg. Leandro Rocca

## 🙏 Agradecimientos

- Mg. Leandro Rocca por el espacio académico

---

⭐ **¡Si este workshop te resultó útil, dale una estrella al repo!** ⭐
