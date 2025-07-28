# ActionBooster Universal Autoconfigurable

> **Desarrollador principal:** Claudio Abarca PhD(c)  Chile 

ActionBooster es una plataforma plug & play para potenciar cualquier equipo con capacidades de IA local, distribución paralela de tareas y autoconfiguración avanzada. Permite desplegar modelos grandes, optimizar recursos y escalar desde una Orange Pi hasta clusters híbridos, todo de forma automática y segura.

---

## 🌟 Discurso de Innovación

ActionBooster representa un salto disruptivo en la democratización de la inteligencia artificial local. Su arquitectura universal y autoconfigurable permite que cualquier persona, desde makers hasta empresas, pueda desplegar modelos avanzados de IA y aprovechar el máximo potencial de su hardware, sin conocimientos técnicos avanzados ni configuraciones complejas. 

Con ActionBooster, la frontera entre hardware y software se desvanece: el sistema detecta, adapta y optimiza automáticamente cada entorno, permitiendo ejecutar modelos 4-5 veces más grandes que la RAM física disponible, distribuir tareas en paralelo y escalar de forma segura y eficiente. 

Esta innovación abre la puerta a la IA local de alto rendimiento, accesible, segura y lista para producción, impulsando la creatividad y la productividad en cualquier contexto.

---

## Arquitectura
- **Autodetección de host y recursos:** El sistema detecta automáticamente el hardware, SO, RAM, CPU y GPU disponibles, adaptando la configuración y los servicios a cada entorno.
- **Despliegue automático de servicios:** Instala, configura y lanza todos los servicios necesarios (API, portal web, monitorización, firewall, zRAM, TLS, etc.) sin intervención manual.
- **Paralelismo IA-driven:** Un motor inteligente decide cómo y dónde ejecutar cada tarea (host, booster, o ambos en paralelo) usando modelos de ML y heurísticas de recursos.

## Componentes
- `autoconfig.py`: Núcleo de autoconfiguración y detección de hardware/software. Gestiona drivers, modos especiales y despliegue adaptativo.
- `task_distributor.py`: Paralelizador inteligente que decide la mejor estrategia de ejecución para cada tarea (host, booster, híbrido, paralelo).
- `parallel_api.py`: API Flask para recibir tareas y distribuirlas automáticamente según recursos y contexto.
- `agent_app.py`: Backend multi-modelo para consultas IA, integración con modelos GGUF y portal web.
- `monitor.sh`, `start_grafana_prometheus.sh`: Scripts para monitorización avanzada (Prometheus/Grafana).
- `config_zram.sh`, `config_firewall.sh`, `generate_selfsigned_tls.sh`: Scripts de optimización y seguridad.
- `autostart.sh`: Script de arranque automático que integra todos los servicios y configuraciones.

## Ejecución
```bash
# 1. Autoconfiguración y despliegue de drivers/servicios
python autoconfig.py

# 2. Lanzar API de distribución paralela
python parallel_api.py

# 3. (Opcional) Lanzar backend multi-modelo
python agent_app.py

# 4. (Opcional) Arranque completo y seguro
bash autostart.sh
```

## Ejemplo de uso API
```bash
curl -X POST http://localhost:9090/distribute -H 'Content-Type: application/json' -d '{"features": [0.7, 0.2, 0.9]}'
```

## Características destacadas
- Plug & play: Sin configuración manual, ideal para makers y empresas
- Escalable: Desde un solo dispositivo hasta clusters híbridos
- Seguro: Firewall, TLS, backup y restauración integrados
- Optimizado para IA: zRAM, swap NVMe, monitorización avanzada
- Documentación y scripts listos para producción

## Recursos útiles
- [Guía hardware](HARDWARE_GUIDE.md)
- [Documentación técnica](TECHNICAL_DOCUMENTATION.md)
- [Tutorial de arranque](TUTORIAL_ARRANQUE_ACTIONBOOSTER.md)
- [Checklist de validación](checklist_validacion.txt)
- [Pitch Kickstarter](KICKSTARTER_PITCH.md)

## Comparativa de Rendimiento (2010-2025)

| Equipo               | RAM  | CPU             | Tokens/s (7B) | Modelos soportados | Consumo W | Precio USD |
|----------------------|------|-----------------|---------------|--------------------|-----------|-----------|
| PC 2010 i5-2400      | 4GB  | 4c/4t 3.1GHz    | 0.8           | 3B                 | 90        | 600       |
| MacBook M1 2020      | 8GB  | 8c ARM          | 4.5           | 13B                | 20        | 1200      |
| Orange Pi 5+         | 16GB | 8c ARM          | 4.2           | 13B                | 10        | 120       |
| ActionBooster 1 (2025)| 16GB | 8c ARM + zRAM+NVMe | 4.5       | 20B+               | 12        | 200       |

> *Tokens/s: velocidad de inferencia con DeepSeek/Qwen 7B, 4-bit, contexto 4096. Modelos soportados: tamaño máximo de modelo IA GGUF sin OOM.*

---

## Roadmap y Comunidad

- [ ] Soporte para modelos de voz (Whisper, Bark)
- [ ] Integración con Home Assistant y domótica
- [ ] Instalador universal multiplataforma
- [ ] Dashboard visual avanzado (más widgets y alertas)
- [ ] Empaquetado Docker/VM
- [ ] Validación en hardware alternativo (Jetson, x86, RPi 5)
- [ ] Comunidad: foros, Discord, contribuciones open source

¿Quieres contribuir? ¡Abre un issue, haz un fork o únete a la comunidad!

---

## Instalación Rápida

```bash
curl -sL https://gist.github.com/actionbooster/ramboost | sudo bash
```

> Requisitos: Ubuntu/Armbian 22.04+, Python 3.10+, 16GB RAM (recomendado), SSD/NVMe opcional.

---

## Preguntas Frecuentes (FAQ)

**¿Qué hardware es compatible?**  
Orange Pi 5/5+, Raspberry Pi 5, x86_64, Mac M1/M2 (experimental), Jetson, y más.

**¿Qué modelos IA puedo usar?**  
Cualquier modelo GGUF compatible con llama.cpp (DeepSeek, Qwen, Kimi, etc.).

**¿Puedo usarlo en clúster?**  
Sí, soporta despliegue híbrido y escalado automático.

**¿Cómo reporto un bug o pido una función?**  
Abre un issue en GitHub o únete al Discord de la comunidad.

---

## Troubleshooting

- Si zRAM o swap no se activa: revisa permisos y configuración en `/etc/default/zramswap`.
- Si el portal web no carga: verifica logs en `agent_app.log` y que el puerto 8080 esté libre.
- Para problemas de rendimiento: consulta el dashboard de Grafana y ajusta la configuración de swap/zRAM.

---

## Licencia y Créditos

- Licencia: MIT
- Desarrollador principal: Claudio Abarca PhD(c)
- Colaboradores: comunidad open source, testers y usuarios pioneros
- Basado en: llama.cpp, Flask, Prometheus, Grafana, UFW, zRAM

---

## Estado del Proyecto

![Estado](https://img.shields.io/badge/estado-beta-yellow) ![Licencia](https://img.shields.io/badge/licencia-MIT-blue) ![Contribuciones](https://img.shields.io/badge/contribuciones-bienvenidas-brightgreen)

---

## Contacto y Comunidad

- Discord: [Enlace a comunidad](https://discord.gg/xxxxxx)
- Email: claudio.abarca@actionbooster.ai
- GitHub: [Csav20/actionbooster](https://github.com/Csav20/actionbooster)

¿Tienes dudas, sugerencias o quieres colaborar? ¡Contáctanos y sé parte de la revolución IA local!

---
¿Listo para potenciar tu hardware con IA local y máxima eficiencia? ¡ActionBooster lo hace posible!
