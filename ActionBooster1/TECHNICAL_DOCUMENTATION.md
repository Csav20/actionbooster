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

## Troubleshooting y Buenas Prácticas

- **zRAM o swap no se activa:** Verifica permisos, configuración en `/etc/default/zramswap` y que el kernel soporte zstd/lz4.
- **Portal web inaccesible:** Revisa logs en `agent_app.log`, asegúrate de que el puerto 8080 esté libre y el firewall permita el acceso.
- **Bajo rendimiento:** Consulta el dashboard de Grafana, ajusta la configuración de swap/zRAM y verifica el uso de CPU/RAM.
- **Problemas de clustering:** Asegúrate de que todos los nodos tengan conectividad y dependencias instaladas (K3s, MPI, Docker).
- **Actualizaciones OTA:** Realiza backups antes de actualizar y valida la integridad de los scripts.

---

## Visualizaciones y Ejemplos Avanzados

- ![Panel de control web](docs/captura_portal.png)
- ![Dashboard de métricas](docs/captura_grafana.png)
- **Integración avanzada:**
  - Despliegue en clúster híbrido (ARM + x86) con balanceo automático.
  - Integración con Home Assistant para automatización local.
  - Ejecución de modelos de voz (Whisper) y visión (Stable Diffusion) en paralelo.

---

## Ejemplos y Casos Prácticos de Uso

### 1. Aceleración de IA en Edge (Orange Pi 5+)
- Despliega modelos DeepSeek 7B y Qwen 7B en local para análisis de texto y generación de código sin conexión a la nube.
- Uso típico: laboratorio educativo, makerspace, oficina remota.

### 2. Clúster Híbrido ARM + x86
- Une varias Orange Pi y PCs x86 en un clúster con balanceo automático de tareas.
- Uso típico: simulaciones científicas, procesamiento de datos en edge, IA distribuida.

### 3. Automatización Domótica con IA
- Integra ActionBooster con Home Assistant para crear reglas inteligentes (ej: control de luces por voz, análisis de imágenes de cámaras locales).
- Uso típico: hogar inteligente, edificios automatizados.

### 4. Servidor Personal de IA y Desarrollo
- Usa el portal web para consultas multi-modelo, edición de código en VS Code online y respaldo automático.
- Uso típico: desarrolladores, estudiantes, equipos de I+D.

### 5. Procesamiento de Voz y Visión
- Ejecuta modelos Whisper (voz a texto) y Stable Diffusion (generación de imágenes) en paralelo, aprovechando la distribución de recursos.
- Uso típico: kioskos interactivos, asistentes virtuales, arte generativo.

### 6. Recuperación y Respaldo Inteligente
- Programa backups automáticos y restauración rápida ante fallos, con scripts integrados.
- Uso típico: pymes, laboratorios, entornos críticos.

### 7. Edge AI para IoT Industrial
- Despliega ActionBooster en gateways industriales para análisis predictivo, mantenimiento y control local.
- Uso típico: fábricas, monitoreo de sensores, logística.

---

## Versiones y Dependencias

- Python >= 3.10
- llama.cpp >= 0.2.0
- Flask >= 2.2
- Prometheus >= 2.50, Grafana >= 10
- UFW, zRAM, Docker (opcional para clustering)

---

## Créditos y Licencia

- Desarrollador principal: Claudio Abarca PhD(c)
- Comunidad open source y testers
- Licencia: MIT
- Basado en: llama.cpp, Flask, Prometheus, Grafana, UFW, zRAM

---

## Contacto y Soporte
Para soporte, contribuciones o dudas técnicas, contacta a: claudio.abarca@actionbooster.ai o únete al Discord de la comunidad.
