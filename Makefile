.PHONY: setup start stop clean logs status workshop

setup:
	@echo "🏗️ Configurando workshop TechStore Universidad"
	@./scripts/prepare_demo.sh

start:
	@echo "🚀 Iniciando Odoo..."
	@docker compose up -d db
	@echo "⏳ Esperando PostgreSQL..."
	@sleep 15
	@docker compose up -d odoo
	@echo "✅ Odoo iniciado en http://localhost:8069"

stop:
	@echo "🛑 Deteniendo servicios..."
	@docker compose down

clean:
	@echo "🧹 Limpiando todo (¡CUIDADO: Borra datos!)..."
	@docker compose down -v
	@docker system prune -f

logs:
	@echo "📋 Mostrando logs de Odoo..."
	@docker compose logs -f odoo

status:
	@echo "📊 Verificando estado..."
	@docker compose ps

workshop: setup start
	@echo "🎓 Workshop listo!"
	@echo "🌐 Accede a: http://localhost:8069"
	@echo "👤 Usuario: admin@techstore.utn.edu.ar"
	@echo "🔑 Password: admin123"
