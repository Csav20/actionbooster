# Guía Técnica: RAM y Hardware para ActionBooster

## ¿Se puede ampliar la RAM en Orange Pi?
Actualmente **ninguna Orange Pi permite ampliar la RAM físicamente** (memoria soldada). Sin embargo, existen alternativas con mayor RAM integrada y placas con **ranuras SO-DIMM intercambiables**.

---

## Placas con RAM Ampliable

### 1. ODROID-H4 / H4+
- **CPU**: Intel N97 (8W) o Core i3-N305
- **RAM**: 2× ranuras DDR5 SO-DIMM (hasta 64GB)
- **Precio**: $120-$220
- **Ventajas**:
  - RAM ampliable
  - NVMe + SATA
  - GPU Intel UHD (AV1)

### 2. LattePanda Sigma
- **CPU**: Intel Core i5-1340P (12c/16t)
- **RAM**: 2× DDR5 SO-DIMM (hasta 64GB)
- **GPU**: Iris Xe (96EU)
- **Precio**: $499
- **Ventajas**:
  - Potencia de laptop gaming en formato SBC
  - Thunderbolt 4 + PCIe 4.0 x4

---

## Comparativa vs Orange Pi
| Característica      | Orange Pi 5 (16GB) | ODROID-H4+ (32GB) | LattePanda Sigma (64GB) |
|--------------------|-------------------|-------------------|------------------------|
| RAM máxima         | 16GB (fija)       | 64GB (2×32GB)     | 64GB (2×32GB)          |
| CPU                | RK3588 (8c ARM)   | Intel N305 (8c)   | Intel i5-1340P (12c)   |
| GPU                | Mali-G610         | Intel UHD         | Iris Xe (1.3 TFLOPS)   |
| Conexiones         | USB 3.0, HDMI 2.1 | USB4, 2.5GbE      | Thunderbolt 4, PCIe 4.0|
| Precio (placa+RAM) | $110              | $220 (con 32GB)   | $700 (con 64GB)        |

---

## Alternativas de Alto Rendimiento (RAM Fija)
- **Orange Pi 5 Plus 32GB**: RAM LPDDR5 fija de 32GB. Ideal para LLMs grandes.
- **Rock 5B 16GB**: Mejor refrigeración + PCIe 3.0 x4.
- **Jetson Orin NX 16GB**: GPU 1024-core + 32 TOPS para IA.

---

## Cómo "Ampliar" RAM en Orange Pi
Aunque no físicamente, puedes usar:

### Técnica 1: ZRAM (Compresión en RAM)
```bash
sudo apt install zram-config
sudo nano /etc/default/zramswap
```
```conf
PERCENT=200  # Crea 2x RAM virtual comprimida
```
**Resultado**: 16GB → 32GB efectivos (con pérdida del 5-10% velocidad)

### Técnica 2: Swap en SSD NVMe
```bash
sudo fallocate -l 32G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```
**Velocidad**: NVMe Gen3 → ~3GB/s (vs DDR5 50GB/s)

---

## Recomendaciones de Compra

### Opción Económica ($250 total)
- ODROID-H4+ ($120)
- 2× RAM 16GB DDR5 ($80) = 32GB ampliables
- SSD NVMe 1TB ($50)

### Opción Profesional ($800 total)
- LattePanda Sigma ($500)
- 2× RAM 32GB DDR5 ($200) = 64GB
- SSD NVMe 2TB ($100)

---

## Rendimiento con DeepSeek Local
| Configuración         | DeepSeek-Coder 33B | Tokens/s |
|----------------------|--------------------|----------|
| Orange Pi 5 (16GB)   | Quantizado 4-bit   | 0.8 t/s  |
| ODROID-H4+ (32GB)    | Quantizado 4-bit   | 1.9 t/s  |
| LattePanda (64GB)    | Sin quantizar 8-bit| 3.5 t/s  |

---

## Dónde Comprar
- ODROID-H4+: [AmeriDroid](https://ameridroid.com/products/odroid-h4)
- RAM DDR5 SODIMM: [Amazon](https://amzn.to/4bJZxqY)
- LattePanda Sigma: [DFRobot](https://www.dfrobot.com/product-2715.html)

---

## Nota Final
La elección de hardware depende del presupuesto, necesidades de IA y escalabilidad. Para LLMs grandes y proyectos HPC, prioriza placas con RAM ampliable y buena refrigeración.
