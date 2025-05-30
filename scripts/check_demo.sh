# scripts/check_demo.sh
#!/bin/bash

echo "🔍 Verificando estado del workshop..."

# Verificar que Docker esté corriendo
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker no está corriendo"
    exit 1
fi

# Verificar contenedores
if docker-compose ps | grep -q "Up"; then
    echo "✅ Contenedores corriendo"
else
    echo "❌ Contenedores no están corriendo"
    echo "💡 Ejecuta: docker-compose up -d"
    exit 1
fi

# Verificar acceso a Odoo
if curl -s http://localhost:8069 > /dev/null; then
    echo "✅ Odoo accesible en http://localhost:8069"
else
    echo "❌ Odoo no responde"
    exit 1
fi

# Verificar logs por errores
if docker-compose logs odoo 2>&1 | grep -i error; then
    echo "⚠️ Se encontraron errores en los logs"
else
    echo "✅ No hay errores en los logs"
fi

echo "🎯 Todo listo para el workshop!"
