# ActionBooster Universal - Documentación Técnica

## Descripción General
ActionBooster es un sistema de edge computing plug-and-play que integra IA generativa, procesamiento paralelo y autoconfiguración universal. Permite acelerar tareas de IA, simulación y desarrollo en cualquier entorno, con operación offline y privacidad avanzada.

---

## Componentes Principales

### 1. Agente Multi-Modelo (`agent_app.py`)
- Orquesta consultas a modelos DeepSeek, Qwen y Kimi en paralelo.
- API REST para recibir prompts y devolver respuestas especializadas y resumen integrado.
- Ejecución eficiente con ThreadPool.

### 2. Núcleo de Autoconfiguración (`autoconfig.py`)
- Detecta sistema operativo, arquitectura y recursos del host.
- Despliega el modo óptimo: legacy, DMA, cluster.
- Permite políticas de paralelismo dinámico.

### 3. Paralelizador Inteligente (`task_distributor.py`)
- Decide en tiempo real dónde ejecutar cada tarea (host, booster, híbrido).
- Utiliza IA (RandomForest simulado) para predicción de destino óptimo.

### 4. API de Distribución (`parallel_api.py`)
- Expone endpoint `/distribute` para asignar tareas automáticamente.
- Integra el TaskDistributor para balanceo inteligente.

### 5. Portal Web (`index.html`)
- Interfaz moderna para consulta multi-modelo y acceso a VS Code online.
- Visualización de respuestas y resumen integrado.

### 6. Servicios y Scripts
- `ai-agent.service`, `parallel-api.service`: servicios systemd para ejecución persistente.
- `install.sh`, `start_services.sh`, `stop_services.sh`: automatización de instalación y gestión.
- `monitor.sh`, `backup.sh`, `restore.sh`, `clean_cache.sh`: monitoreo, respaldo y mantenimiento.
- `nginx-prototype.conf`: configuración Nginx para portal y API.

---

## Flujo de Trabajo
1. **Instalación**: Ejecuta `install.sh` para preparar el entorno y dependencias.
2. **Inicio de servicios**: Usa `start_services.sh` o los servicios systemd para iniciar el agente y la API.
3. **Acceso web**: Portal en `http://localhost` y VS Code en `http://localhost:8080`.
4. **Consulta IA**: Envía prompts vía portal web o API REST (`/query`).
5. **Distribución de tareas**: Usa `/distribute` para balanceo automático entre host y booster.
6. **Monitoreo y backup**: Ejecuta scripts de mantenimiento según necesidad.

---

## Seguridad y Privacidad
- Operación offline y aislamiento de red por defecto.
- Firewall y cifrado recomendados para producción.
- No se envían datos a la nube.

---

## Extensiones y Personalización
- Añade nuevos modelos GGUF en `models/` y actualiza rutas en configuración.
- Integra clustering real con K3s, MPI o Docker Swarm.
- Personaliza portal web y API según necesidades del usuario.

---

## Requisitos de Hardware
- Orange Pi 5/5+ recomendado (8GB/16GB RAM, SSD/NVMe).
- Compatible con Mac M-series, PC x86, ARM y sistemas legacy.

---

## Ejemplo de Uso API
```bash
curl -X POST http://localhost:5000/query -H 'Content-Type: application/json' -d '{"prompt": "Optimiza este código Python..."}'
```

---

## Roadmap y Mejoras Futuras
- Integración de firmware y drivers para autodetección universal.
- Panel de control web con métricas en tiempo real.
- Seguridad avanzada: autenticación, cifrado, OTA.
- Soporte para clustering y balanceo de carga distribuido.

---

## Contacto y Soporte
Para soporte, contribuciones o dudas técnicas, contacta a: actionbooster@dev.local
