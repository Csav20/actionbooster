import os
from flask import Flask, request, jsonify
from concurrent.futures import ThreadPoolExecutor, as_completed
import subprocess

# Configuración de modelos y rutas
MODELS = {
    "deepseek": "/ssd/models/deepseek-coder-1.3b.Q4_K_M.gguf",
    "qwen": "/ssd/models/qwen1.5-1.8b-chat-q4_k_m.gguf",
    "kimi": "/ssd/models/kimi-1.8b.Q4_K_M.gguf"
}

app = Flask(__name__)
executor = ThreadPoolExecutor(max_workers=3)

# Simulación de inferencia con llama.cpp (ajusta según integración real)
def run_llama_cpp(model_path, prompt):
    cmd = [
        "llama.cpp",
        "--model", model_path,
        "--prompt", prompt,
        "--threads", str(os.cpu_count() or 4),
        "--ctx-size", "4096",
        "--n-predict", "256"
    ]
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=60)
        return result.stdout.strip()
    except Exception as e:
        return f"Error: {e}"

@app.route("/query", methods=["POST"])
def query_models():
    data = request.json
    prompt = data.get("prompt", "")
    results = {}
    futures = {}
    # Ejecuta cada modelo en paralelo
    for name, path in MODELS.items():
        futures[name] = executor.submit(run_llama_cpp, path, prompt)
    for name, future in futures.items():
        results[name] = future.result()
    # Resumen integrado (simple concatenación, puedes mejorar con LLM)
    summary = "\n---\n".join([f"{k}: {v[:200]}..." for k, v in results.items()])
    return jsonify({"results": results, "summary": summary})

@app.route("/health", methods=["GET"])
def health():
    return jsonify({"status": "ok", "models": list(MODELS.keys())})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
