from flask import Flask, request, jsonify
import os
import subprocess
import json
from datetime import datetime

app = Flask(__name__)

# Configurações do GitHub
REPO_PATH = os.path.join(os.getcwd(), "..", "tera_app") # Assume que o repo está aqui
DB_FILE = "database.json"

def sync_to_github():
    try:
        os.chdir(REPO_PATH)
        subprocess.run(["git", "add", "."], check=True)
        subprocess.run(["git", "commit", "-m", f"Auto-sync DB: {datetime.now().isoformat()}"], check=True)
        subprocess.run(["git", "push", "origin", "main"], check=True)
        return True
    except Exception as e:
        print(f"Erro ao sincronizar com GitHub: {e}")
        return False

@app.route('/save', methods=['POST'])
def save_data():
    data = request.json
    try:
        # Salva localmente
        with open(os.path.join(REPO_PATH, DB_FILE), 'w') as f:
            json.dump(data, f, indent=4)
        
        # Sincroniza com GitHub
        success = sync_to_github()
        
        return jsonify({"status": "success" if success else "partial_success", "message": "Dados salvos e sincronizados" if success else "Dados salvos localmente, erro no GitHub"}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

@app.route('/load', methods=['GET'])
def load_data():
    try:
        with open(os.path.join(REPO_PATH, DB_FILE), 'r') as f:
            data = json.load(f)
        return jsonify(data), 200
    except FileNotFoundError:
        return jsonify({}), 200
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
