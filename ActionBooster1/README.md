<<<<<<< HEAD
# actionbooster
=======
# ActionBooster Universal Autoconfigurable

## Arquitectura
- Autodetección de host y recursos
- Despliegue automático de servicios
- Paralelismo IA-driven

## Componentes
- `autoconfig.py`: Núcleo de autoconfiguración
- `task_distributor.py`: Paralelizador inteligente
- `parallel_api.py`: API Flask para distribución de tareas

## Ejecución
```bash
python autoconfig.py
python parallel_api.py
```

## Ejemplo de uso API
```bash
curl -X POST http://localhost:9090/distribute -H 'Content-Type: application/json' -d '{"features": [0.7, 0.2, 0.9]}'
```
>>>>>>> de6daf6 (Primer commit de ActionBooster1)
