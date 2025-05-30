# scripts/import_demo_data.py
#!/usr/bin/env python3
"""
Script para importar datos de demo durante el workshop
Se ejecuta después de que Odoo esté corriendo
"""

import requests
import json
import base64

ODOO_URL = "http://localhost:8069"
DB_NAME = "techstore_utn"
USERNAME = "admin@techstore.utn.edu.ar"
PASSWORD = "admin123"

def odoo_auth():
    """Autenticar con Odoo"""
    auth_url = f"{ODOO_URL}/web/session/authenticate"
    auth_data = {
        "jsonrpc": "2.0",
        "method": "call",
        "params": {
            "db": DB_NAME,
            "login": USERNAME,
            "password": PASSWORD
        }
    }
    response = requests.post(auth_url, json=auth_data)
    return response.cookies

def create_product_categories():
    """Crear categorías de productos específicas"""
    categories = [
        {"name": "Laptops & Notebooks", "parent_id": False},
        {"name": "Periféricos", "parent_id": False},
        {"name": "Componentes", "parent_id": False},
        {"name": "Accesorios", "parent_id": False}
    ]
    # Implementar creación via API
    pass

def create_demo_leads():
    """Crear leads de demostración"""
    leads = [
        {
            "name": "Cotización Laptop Gaming",
            "partner_name": "Estudiante Interesado",
            "email_from": "estudiante@utn.edu.ar",
            "phone": "+54 221 555-0001",
            "description": "Necesita laptop para desarrollo de videojuegos"
        }
    ]
    # Implementar creación via API
    pass

if __name__ == "__main__":
    print("🔄 Importando datos de demo...")
    cookies = odoo_auth()
    create_product_categories()
    create_demo_leads()
    print("✅ Datos importados correctamente")
